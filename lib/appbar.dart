import 'package:flutter/material.dart';
import 'package:move_application/style/text_style.dart';
import 'package:move_application/HomePage.dart';

class CustomAppbar extends AppBar{
  final String _zone_name ;

  CustomAppbar(this._zone_name):super(
    title: Text(_zone_name+'존',style: MyTextStyle(size: 30),),
    centerTitle: true,
    backgroundColor: Colors.white,
    shadowColor: null,
    iconTheme: IconThemeData(color: Colors.black),
  );
}