import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  void Function()? onTap;
  final String text;
  final Color color;


  MyButton({super.key, required this.text, required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8)
        ),
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(text, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),),
        ),
      ),
    );
  }
}
