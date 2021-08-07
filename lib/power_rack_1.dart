import 'package:flutter/material.dart';
import 'package:move_application/appbar.dart';
import 'package:move_application/view/aa.dart';
import 'package:simple_timetable/simple_timetable.dart';
import 'package:flutter/material.dart';
import 'package:simple_timetable/simple_timetable.dart';
import 'package:flutter_timetable_view/flutter_timetable_view.dart';

class Event<T> {
  final String id;
  final DateTime start;
  final DateTime end;
  final DateTime date;
  final T payload;

  Event({
    required this.id,
    required this.start,
    required this.end,
    required this.date,
    required this.payload,
  });
}
class Power_Rack_1 extends StatelessWidget{
  DateTime _month = DateTime.now();
  DateTime _initDate = DateTime.now();
  int visibleRange = 7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(color: Colors.black,height: 10,),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Row(
              children: [

                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: TimetableView(

                    timetableStyle: TimetableStyle(
                      timeItemTextColor: Colors.black,
                      startHour: 10,
                      endHour: 23,
                      laneHeight: MediaQuery.of(context).size.height * 0.05,
                      laneWidth: MediaQuery.of(context).size.width * 0.33,
                      visibleDecorationBorder: true,
                      decorationLineDashSpaceWidth: 0,

                      decorationLineBorderColor: Colors.black,
                      timeItemWidth: 50,
                      cornerColor: Colors.black12,
                      timeItemHeight: 150,
                      timelineItemColor: Colors.yellowAccent,
                      timelineBorderColor: Colors.black,


                    ),
                    laneEventsList: [
                      LaneEvents(
                          lane: Lane(
                            name: '8/6일',
                            width:MediaQuery.of(context).size.width * 0.35,
                            textStyle: TextStyle(color: Colors.black)

                          ),
                          events: [TableEvent(
                              title: '',
                              start: TableEventTime(hour:10, minute: 0),
                              end: TableEventTime(hour: 10, minute: 15),
                              textStyle: TextStyle(color: Colors.black,fontSize: 9,fontWeight: FontWeight.bold),

                              backgroundColor: Colors.yellow
                          ),
                          ]
                      ),
                    ],
                  ),
                )
              ],
            ),
          )



        ],
      ),
    );
  }
  List<TableEvent> _list(){
    List<TableEvent> a = [];
    for(int i =0;i<visibleRange;i+2){
      a.add(TableEvent(
          title: 'dddddddddddddddddddd',
          start: TableEventTime(hour: i+8, minute: 0),
          end: TableEventTime(hour: i+9, minute: 30),
          textStyle: TextStyle(color: Colors.black,fontSize: 50),

          backgroundColor: Colors.yellow
      ));
    }
    return a;
  }
}
