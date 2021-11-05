import 'package:flutter/material.dart';

class Board extends StatefulWidget{
  @override
  _Board createState() => _Board();

}

class _Board extends State<Board>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('게시판이 될 곳 입니다'),
      ),
    );
  }

}