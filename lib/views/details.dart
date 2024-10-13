import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Center(child:Image.network("https://handsomedans.co.uk/cdn/shop/products/hd-shelton-jacket-462647.jpg?v=1719578641&width=1214")),
                Container(
                  height: 600,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Oversized Coat",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                        Text(
                          "Rs.3000",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "I wouldn't recommend just grabbing any coat and going up a size or two. True oversize coats will be labeled  clearly on their product name when you shop online (or on the tag if you're shopping in person) and are made this way intentionally, so you should take your normal size. You can find them in neutral colors, bold patterns, in faux fur texture, trench texture, or classic wool. Choose your fighter! See a selection of our current favorite oversize jackets below to see what I mean.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}