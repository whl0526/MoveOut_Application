import 'package:flutter/material.dart';
import 'package:move_application/view/appbar.dart';

class food extends StatefulWidget{
  final String space_name;
  food({required this.space_name});
  @override
  _food createState() => _food();
}

class _food extends State<food>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(widget.space_name),

    );
  }

}