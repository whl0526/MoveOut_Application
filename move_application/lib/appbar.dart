import 'package:flutter/material.dart';
import 'package:move_application/style/text_style.dart';

class CustomAppbar extends AppBar{
  CustomAppbar():super(
    leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu),color: Colors.black,),
    title: Text('비켜',style:TitleStyle,),
    actions: [IconButton(onPressed: (){},icon : Icon(Icons.doorbell_sharp),color: Colors.black,iconSize: 35,
    )],
    centerTitle: true,
    backgroundColor: Colors.white,
    shadowColor: null,
    elevation: 0.0,
  );
}