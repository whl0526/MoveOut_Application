import 'package:flutter/material.dart';

class CustomEndDrawer extends Drawer {

  static const List<String> _text=[
    '안',
    '녕',
    '하',
    '세',
    '욥',
    'ha',
    'ho',
    '뭐로바꿀까',
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: _text.length,
        itemBuilder: (BuildContext _context, int i){
          return ListTile(
            leading: Icon(Icons.alarm,size: 33,color: Colors.red[700],),
            title: Text('새로운 알람!'),
            subtitle: Text(_text[i]),
          );
        },

      ),
    );
  }
}
