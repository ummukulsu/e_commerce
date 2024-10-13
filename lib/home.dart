import 'package:e_commerce/components/colors.dart';
import 'package:e_commerce/views/cart.dart';
import 'package:e_commerce/views/details.dart';
import 'package:e_commerce/views/men.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePagee extends StatefulWidget {
  const HomePagee({super.key});

  @override
  State<HomePagee> createState() => _HomePageState();
}

class _HomePageState extends State<HomePagee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primarycolor,
        title: Center(
          child: Text(
            "Modern Muse",
            style: TextStyle(
                color: Colors.white, fontStyle: FontStyle.italic, fontSize: 15),
          ),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: 50),
              Text(
                "MODERN MUSE",
                style: TextStyle(
                  color: primarycolor,
                ),
                textAlign: TextAlign.center,
              ),
              Divider(color: Color.fromARGB(255, 226, 221, 221)),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home", style: TextStyle(fontSize: 16)),
                trailing: InkWell(onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomePagee();
                      }));
                    },
                  child: Icon(Icons.arrow_forward_ios_rounded)),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text("Cart"),
                trailing: InkWell(onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Cart();
                      }));
                    },
                  child: 
                Icon(Icons.arrow_forward_ios_rounded)),
              ),
              ListTile(
                leading: Icon(Icons.book_online),
                title: Text("Order Details"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              Divider(color: Color.fromARGB(255, 219, 213, 213)),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("LogOut"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Category",
              style: TextStyle(
                  color: Colors.indigo[800],
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Men();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.indigo[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Men")),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Most Search Products",
              style: TextStyle(
                  color: Colors.indigo[800],
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Details();
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Image.network(
                              "https://handsomedans.co.uk/cdn/shop/products/hd-shelton-jacket-462647.jpg?v=1719578641&width=1214",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 150,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Coat"),
                                Text(
                                  "Rs. 3000",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
