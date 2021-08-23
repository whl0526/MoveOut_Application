import 'dart:collection';
import 'dart:convert';

import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:move_application/appbar.dart';
import 'package:simple_timetable/simple_timetable.dart';
import 'package:flutter/material.dart';
import 'package:simple_timetable/simple_timetable.dart';
import 'package:flutter_timetable_view/flutter_timetable_view.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:http/http.dart' as http;
import 'package:move_application/get_reservation_time.dart';



class Power_Rack_1 extends StatefulWidget{
  final String day;
  Power_Rack_1({required this.day});

  @override
  _Power_Rack_1 createState() => _Power_Rack_1();
}

class _Power_Rack_1 extends State<Power_Rack_1>{


  TimeOfDay _time = TimeOfDay.now();

  void onTimeChanged(TimeOfDay newTime) {

    setState(() {
      _time = newTime;
      _start_time = _time.hour.toString()+'시 '+_time.minute.toString()+'분';
    });
  }




  Future _selectMin() async {
    Navigator.of(context).push(
      showPicker(
        context: context,
        value: _time,
        onChange: onTimeChanged,
        minuteInterval: MinuteInterval.FIVE ,
        maxHour: 21,
        minHour: 17,
        maxMinute: 55,
        iosStylePicker: true,
        is24HrFormat: true,
        borderRadius: 55,
        barrierDismissible: false,
        displayHeader: false,
      ),
    );
  }

  List<TableEvent> _list(snapshot){
    List<TableEvent> machineReservationTime = [];
    List<dynamic> machineReservationStartTimeHour = snapshot.data.machine_reservation_StartTime_hour;
    List<dynamic>  machineReservationStartTimeMinute = snapshot.data.machine_reservation_StartTime_minute;
    List<dynamic>  machineReservationEndTimeHour = snapshot.data.machine_reservation_EndTime_hour;
    List<dynamic>  machineReservationEndTimeMinute = snapshot.data.machine_reservation_EndTime_minute;

    for(int i =0;i<machineReservationStartTimeHour.length.toInt();i++){
      machineReservationTime.add(TableEvent(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        margin: EdgeInsets.zero,
        title: '',
        start: TableEventTime(
            hour: machineReservationStartTimeHour.elementAt(i).toInt(),
            minute: machineReservationStartTimeMinute.elementAt(i).toInt()
        ),
        end: TableEventTime(
            hour: machineReservationEndTimeHour.elementAt(i).toInt(),
            minute: machineReservationEndTimeMinute.elementAt(i).toInt()
        ),
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,

        ),
        onTap: (){
          showDialog(context: this.context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('예약시간 확인'),
              content:  Text('${i}'+'시00분 ~ '+'${i}'+'시'+ '${visibleRange+8}'+'분'),
              actions: [

                new FlatButton(
                    child: new Text("닫기"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          }
          );
        },
        decoration: BoxDecoration(color: Colors.yellow,backgroundBlendMode:backgroundBlendMode ),
      ));
    }
    return machineReservationTime;
  }
  Future<Null> _onReFresh() async {
    setState(() {});
  }

  final BlendMode? backgroundBlendMode = BlendMode.darken;
  DateTime _month = DateTime.now();
  DateTime _initDate = DateTime.now();
  String _start_time = '시작 시간 선택';
  int visibleRange = 7;
  String _use_time = '이용 시간 선택';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('웨이트'),
      body: RefreshIndicator(
        onRefresh: _onReFresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.85,

                child: Row(
                  children: [
                    FutureBuilder(
                      future: getReservation_times(),
                      builder: (BuildContext context, AsyncSnapshot<Reservation_times> snapshot) {
                        if (snapshot.hasData == false) {
                          return CircularProgressIndicator();
                        }

                      return Container(
                        width: MediaQuery.of(context).size.width*0.55
                        ,
                        child: TimetableView(
                          timetableStyle: TimetableStyle(
                              timeItemTextColor: Colors.black,
                              startHour: 10,
                              endHour: 23,
                              laneHeight: MediaQuery.of(context).size.height * 0.07,
                              laneWidth: MediaQuery.of(context).size.width * 0.4,
                              visibleDecorationBorder: true,
                              decorationLineDashSpaceWidth: 0,
                              decorationLineBorderColor: Colors.black,
                              timeItemWidth: 60,
                              timeItemHeight: 150,
                              timelineBorderColor: Colors.black,
                              decorationLineHeight: 150/12
                          ),
                          laneEventsList: [
                            LaneEvents(
                                lane: Lane(

                                  name: 'Power_Rack_1 8/'+widget.day,
                                  width:MediaQuery.of(context).size.width * 0.4,
                                  textStyle: TextStyle(color: Colors.black,),


                                ),
                                events: _list(snapshot)
                            ),
                          ],
                        ),
                      );

                    },),

                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          SizedBox(height:MediaQuery.of(context).size.height*0.2,),
                          Container(
                            child: Row(
                              children: [
                                IconButton(icon: Icon(Icons.timer,size: 30), onPressed: () async {
                                 _selectMin();


                                },),
                                Container(
                                  child:Text(_start_time),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child:Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.watch_sharp, size: 30),
                                  onPressed: () async {
                                    showDialog(
                                        context:context,
                                        builder: (BuildContext context){
                                          int selectedRadio = 0;
                                          return AlertDialog(
                                            content: StatefulBuilder(
                                              builder: (BuildContext context, StateSetter setState){
                                                return Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: List<Widget>.generate(4,(int index){
                                                    return RadioListTile<int>(
                                                      title: Text(((index+1)*5).toString()+'분'),
                                                      value: index,
                                                      groupValue:selectedRadio,
                                                      onChanged:(value) {
                                                        setState(()=> (selectedRadio=value!)
                                                        );
                                                      },


                                                    );

                                                  }),
                                                );
                                              },
                                            ),
                                            actions: [
                                              new FlatButton(
                                                  child: new Text("선택"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    _use_time = selectedRadio.toString();
                                                    setState(() {
                                                      if(_use_time== "0")_use_time= '5분';
                                                      else if(_use_time == "1"){
                                                        _use_time= '10분';
                                                      } else if(_use_time == "2"){
                                                        _use_time= '15분';
                                                      } else if(_use_time == "3"){
                                                        _use_time= '20분';
                                                      }
                                                    });
                                                  })
                                            ],
                                          );

                                        }
                                    );

                                  },
                                ),
                                Container(
                                  child: Text(_use_time),
                                ),
                              ],
                            ),
                          ),

                          RaisedButton(onPressed: () async {
                            if(_start_time == '시작 시간 선택'||_use_time =='이용 시간 선택'){
                              showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('이용시간 미선택'),
                                  content:  Text('예약시간과 이용시간을 선택해 주세요'),
                                  actions: [
                                    new FlatButton(
                                        child: new Text("닫기"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        })
                                  ],
                                );
                              }
                              );
                            }else {
                              _use_time = _use_time.split('분').first;
                              List selected_time_list = _start_time.split(" ");
                              String reservation_hour = selected_time_list[0].split('시').first;
                              String reservation_min = selected_time_list[1].split('분').first;
                              var url = 'http://10.0.2.2:5000/reservation/${reservation_hour}/${reservation_min}/${_use_time}';
                              var response = await http.get(url);
                              Map<String , dynamic> test_json_file= jsonDecode(response.body);
                              print(response.statusCode);
                              print(test_json_file);
                            }
                            

                          },child: Text('예약하기'),),
                          SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                          RaisedButton(onPressed: () async {
                            var response = await http.get('http://10.0.2.2:5000/echo_call/');
                            Map<String , dynamic> test_json_file= jsonDecode(response.body);
                            print(response.statusCode);

                            print(test_json_file['_StartTime_minute']);
                          },child: Text('dd'),)

                        ],
                      ),
                      width: MediaQuery.of(context).size.width*0.45,

                    )
                  ],
                ),
              )



            ],
          ),
        ),
      )

    );
  }

}
