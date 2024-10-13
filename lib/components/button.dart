import 'package:e_commerce/components/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback press;
  const Button({super.key, required this.label, required this.press});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 50,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(30)),
      child: TextButton(
          onPressed: press,
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
