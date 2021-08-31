import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:move_application/work_out.dart';

class Reservation extends StatefulWidget{
  @override
  _Reservation createState() => _Reservation();

}

class _Reservation extends State<Reservation> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

         // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            SizedBox(
              height: 50,
            ),
            Container(

              height:175,
              margin: EdgeInsets.all(15),

              child:ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () async{
                      final res = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => work_out(space_name:'유산소' ,)));
                    },
                    child:  buildCategory("images/treadmill.jpg", "유산소 존"),
                  ),InkWell(
                      onTap: () async{
                        final res = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) => work_out(space_name:'중앙 웨이트')));
                      },
                    child:  buildCategory("images/bench.jpg", "중앙 웨이트 존"),

                  ),InkWell(
                    onTap: () async{
                      final res = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => work_out(space_name:'프리웨이트, 머신')));
                    },
                    child:  buildCategory("images/deadlift.jpg", "프리웨이트, 머신 존"),

                  ),InkWell(
                    onTap: () async{
                      final res = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => work_out(space_name:'하체')));
                    },
                    child:  buildCategory("images/squat.jpg", "하체 존"),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

    Widget buildCategory(String imageUrl, String title) {
      return Container(
        width: 160,
        decoration: BoxDecoration(
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(16),
          color:Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                child: Image.asset(imageUrl, fit: BoxFit.fill,),
                aspectRatio: 1 / 0.85,
              ),
              SizedBox(
                height: 10,
              ),
              Text(title),
            ],
          ),
        ),
      );
    }
  }

