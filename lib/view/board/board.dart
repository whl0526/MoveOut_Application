import 'package:flutter/material.dart';
import 'package:move_application/view/appbar.dart';

class Board extends StatefulWidget{
  final String category;
  Board({required this.category});
  @override
  _Board createState() => _Board();
}

class _Board extends State<Board>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(widget.category),
    );
  }

}