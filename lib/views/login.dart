import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce/views/register.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/components/textfield.dart';
import 'package:e_commerce/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;
  bool _isloading = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscureText = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCounter();
  } //shared preference

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    log("isLoaggedIn=$isLoggedIn");
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePagee()));
    }
  } // login webservices

  Future<void> logIn(String username, String password) async {
    setState(() {
      _isloading = true;
    });

    final Map<String, String> LoginData = {
      'username': username,
      'passweord': password,
    };
    log(LoginData as String);

    final Response = await http.post(
      Uri.parse("http://bootcamp.cyralearnings.com/ecom. login.php"),
      body: LoginData,
    );
    log(Response.statusCode.toString());
    if (Response.statusCode == 200) {
      if (Response.body.contains('success')) {
        log("login succesfully completed");

        final prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true);
        prefs.setString('username', username);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePagee()));
      } else {
        log("login failed");
      }
    } else {
      log("error: ${json.decode(Response.body)['error']}");
    }
    setState(() {
      _isloading = false;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // Username validation function
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your username";
    } else if (value.length < 4) {
      return "Username must be at least 4 characters long";
    }
    return null;
  }

  // Password validation function
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Login with your username and password",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 135, 134, 134),
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 50),

                // Username InputField with Validator
                InputField(
                  hintText: "Username",
                  controller: usernameController,
                  validator: _validateUsername, // Using username validation
                ),
                SizedBox(height: 20),

                // Password InputField with Validator and Visibility Toggle
                InputField(
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: _obscureText, // Use the state for visibility
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: _togglePasswordVisibility, // Toggle visibility
                  ),
                  validator: _validatePassword, // Using password validation
                ),
                SizedBox(height: 100),
                _isloading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            // Navigate to the home page if the form is valid
                            logIn(username, password);
                          } else {
                            print(
                                "Form is not valid. Please correct the errors.");
                          }
                        },
                        child: Text("Login"),
                      ),
                SizedBox(height: 30),

                // Register Redirection
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Register();
                        }));
                      },
                      child: Text(
                        "Register here",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
