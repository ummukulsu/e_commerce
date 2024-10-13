import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce/components/button.dart';
import 'package:e_commerce/components/textfield.dart';
import 'package:e_commerce/home.dart';
import 'package:e_commerce/views/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _obscureText = true; // State to manage password visibility
  String? name, phone, address, username, password;
  final bool _isloading = false;
  //registration webservices
  //future=to use async
  //async=to fetch and read data
  Future<void> registration(
      String name, phone, address, username, password) async {
    // ignore: unused_local_variable
    Set<void> result;
    final Map<String, dynamic> logindata = {
      //key:value
      'name': name,
      "phone": phone,
      "address": address,
      "username": username,
      "password": password
    };
    final response = await http.post(
        Uri.parse("http://bootcamp.cyralearnings.com/ecom.registration.php"),
        body: logindata);
    print(response.statusCode);
    if (response.statusCode == 200) {
      if (response.body.contains("success")) {
        print("registration successfully completed");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        print("registration failed");
      }
    } else {
      result = {
        log(json.decode(response.body)['error'].toString()),
      };
    }
  }

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle password visibility
    });
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
                  "Register Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Please complete your details",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 135, 134, 134),
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 50),
                InputField(
                  hintText: "Name",
                  controller: nameController,
                  length: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                InputField(
                  hintText: "Phone",
                  controller: phoneController,
                  length: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter phone number";
                    } else if (value.length < 10) {
                      return "Phone number must be at least 10 characters long";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                InputField(
                  hintText: "Address",
                  controller: addressController,
                  length: 3,
                  expand: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your address";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                InputField(
                  hintText: "Username",
                  controller: usernameController,
                  length: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your username";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                InputField(
                  hintText: "Password",
                  controller: passwordController,
                  length: 1,
                  obscureText: _obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters long";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                _isloading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      )
                    : Button(
                        label: "Register",
                        press: () {
                          if (_formkey.currentState!.validate()) {
                            log("name=$name");
                            log("phone=$phone");
                            log("address=$address");
                            log("username=$username");
                            log("password=$password");
                            //reg button click
                            registration(
                                name!, phone!, address!, username!, password!);
                          }
                        },
                      ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                      child: Text(
                        "Login here",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
