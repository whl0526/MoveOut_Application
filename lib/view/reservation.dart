import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:move_application/weight_zone.dart';
class Reservation extends StatefulWidget{
  @override
  _Reservation createState() => _Reservation();

}

class _Reservation extends State<Reservation> {

  String _min = '아직 시간 선택 안됐음';



  Future _selectMin() async {
    TimeOfDay? pick_min =
        await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now()
        );

    if (pick_min != null)
      setState(() => _min =
          pick_min.hour.toString() + '시' + pick_min.minute.toString() + '분');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(65, 20, 65, 0),
              child:  Row(

                children: [
                  Column(
                    children: [
                      // IconButton(icon: Icon(Icons.timer,size: 30), onPressed: () async {
                      //   _selectMin();
                      // },),  SizedBox(height: 10,),
                      // Container(
                      //   child: Text(_min),
                      // ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () {  },
                    child:  Text('유산소'),
                  ),RaisedButton(
                    onPressed: () {  },
                    child:  Text('하체실'),
                  ),RaisedButton(
                    onPressed: () async{

                      final res = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => weight_zone()));

                    },
                    child:  Text('웨이트존'),
                  ),RaisedButton(
                    onPressed: () {  },
                    child:  Text('머신'),
                  ),

                ],
              ),
            )
            




          ],
        ),

    );
  }


}