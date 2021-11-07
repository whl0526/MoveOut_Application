import 'package:flutter/material.dart';
import 'board.dart';

class BoardCategory extends StatefulWidget{
  @override
  _BoardCategory createState() => _BoardCategory();

}

class _BoardCategory extends State<BoardCategory>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:RaisedButton(
          onPressed: () async{
            final res = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => Board(category: "식단",)));
          },
          child: Text('게시판이동'),
        ),
      ),
    );
  }

}