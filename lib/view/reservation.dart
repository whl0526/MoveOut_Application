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
      body: Container(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      ),
                    ],
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
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
            ],
          ),
            ),
    );
  }

    Widget buildCategory(String imageUrl, String title) {
      return Container(
        width: (MediaQuery.of(context).size.width-90)/1.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius:3,
              offset: Offset(5,5),
              color: Colors.grey.withOpacity(0.3),
            ),
            BoxShadow(
              blurRadius:3,
              offset: Offset(-5,-5),
              color: Colors.grey.withOpacity(0.3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                child: Image.asset(imageUrl, fit: BoxFit.fill,),
                aspectRatio: 1 / 0.85,
              ),
              SizedBox(
                height:MediaQuery.of(context).size.height/50,
              ),
              Text(title),
            ],
          ),
        ),
      );
    }
  }

