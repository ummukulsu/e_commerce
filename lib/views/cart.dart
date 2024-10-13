import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Drawer();
              }));
            },
            child: Icon(Icons.arrow_back_ios_rounded)),
        title: Text(
          "cart",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        actions: [Icon(Icons.delete)],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              height: 100,
              width: 100,
              "https://handsomedans.co.uk/cdn/shop/products/hd-shelton-jacket-462647.jpg?v=1719578641&width=1214"),
          Column(
            children: [
              Text("shirt"),
              Text(
                "3000.0",
                style: TextStyle(color: Colors.red),
              )
            ],
          )
        ],
      ),
    );
  }
}
