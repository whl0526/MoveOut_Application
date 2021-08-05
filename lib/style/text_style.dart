import 'package:flutter/material.dart';

//color

const TitleStyle = TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.8
);

class MyTextStyle extends TextStyle {
  final Color color;
  final FontWeight fontWeight;
  final double size;

  const MyTextStyle({
    this.color = Colors.black,
    this.fontWeight = FontWeight.bold,
    required this.size,
  })  : assert(size != null),
        super(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
      );
}