import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({Key? key,
    this.color = const Color(0xFFECEFF1),
    required this.text,
    this.size = 30,
    this.overflow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}