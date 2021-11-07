import 'package:flutter/material.dart';
import 'package:move_application/view/appbar.dart';

class freetalk extends StatefulWidget{
  final String space_name;
  freetalk({required this.space_name});
  @override
  _freetalk createState() => _freetalk();
}

class _freetalk extends State<freetalk>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(widget.space_name),

    );
  }

}