import 'package:flutter/material.dart';
import 'package:move_application/style/text_style.dart';

class CustomAppbar extends AppBar{
  final String _zone_name ;

  CustomAppbar(this._zone_name):super(
    title: Text(_zone_name+'존',style: TextStyle(color: Colors.black,
        fontSize: 25,
        letterSpacing: 2.0,
        fontWeight: FontWeight.w600),
    ),

    centerTitle: true,
    backgroundColor: Colors.white,
    shadowColor: null,
    iconTheme: IconThemeData(color: Colors.yellow),
  );
}

