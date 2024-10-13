import 'package:e_commerce/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Men extends StatelessWidget {
  const Men({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePagee();
              }));
            },
            child: Icon(Icons.arrow_back_ios_rounded)),
        title: Text(
          "Men",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
