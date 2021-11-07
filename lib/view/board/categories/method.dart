import 'package:flutter/material.dart';
import 'package:move_application/view/appbar.dart';

class method extends StatefulWidget{
  final String space_name;
  method({required this.space_name});
  @override
  _method createState() => _method();
}

class _method extends State<method>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(widget.space_name),

    );
  }

}