import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Reservation extends StatefulWidget{
  @override
  _Reservation createState() => _Reservation();

}

class _Reservation extends State<Reservation> {

  String _value = '아직 날짜 선택 안됐음';

  Future _selectDate() async {
    var _today =  DateTime.now();
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 2)),
    );
    if(picked != null) setState(() => _value = picked.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(icon: Icon(Icons.favorite_border), onPressed: () async {
              _selectDate();
              print(_value);
            },),
            Container(
              child: Text(_value),

            ),
            IconButton(icon: Icon(Icons.favorite_border), onPressed: () async {
              _selectDate();
              print(_value);
            },),
            Container(
              child: Text(_value),

            ),
          ],
        ),
      ),
    );
  }


}