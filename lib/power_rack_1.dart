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
            height: MediaQuery.of(context).size.height * 0.5,
            child: Row(
              children: [

                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TimetableView(
                    timetableStyle: TimetableStyle(timeItemTextColor: Colors.black,timelineItemColor: Colors.red),
                    laneEventsList: [
                      LaneEvents(
                          lane: Lane(
                            name: 'Track A',
                          ),
                          events: _list()
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
    for(int i =0;i<visibleRange;i++){
      a.add(TableEvent(
          title: '${i}+11',
          start: TableEventTime(hour: i+4, minute: 0),
          end: TableEventTime(hour: i+4, minute: 30),
          textStyle: TextStyle(color: Colors.black,fontSize: 50),
          backgroundColor: Colors.blue
      ));
    }
    return a;
  }
}
