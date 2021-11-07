import 'package:flutter/material.dart';
import 'package:move_application/view/appbar.dart';

class cloth extends StatefulWidget{
  final String space_name;
  cloth({required this.space_name});
  @override
  _cloth createState() => _cloth();
}

class _cloth extends State<cloth>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(widget.space_name),

    );
  }

}