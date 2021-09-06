
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'package:move_application/models/post_machine_reservation.dart';
import 'package:move_application/view/appbar.dart';

import 'package:flutter_timetable_view/flutter_timetable_view.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:move_application/style/text_style.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../models/get_reservation_time.dart';


class Power_Rack_1 extends StatefulWidget{
  final DateTime date;
  Power_Rack_1({required this.date});

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
        borderRadius: 10,
        displayHeader: false,
        hourLabel: "시"+'\t'+'\t'+'\t',
        minuteLabel: "분",
        accentColor: Colors.black,
        unselectedColor: Colors.grey,
        cancelText: "취소",
        okText: "설정",
        okCancelStyle: TextStyle(fontSize:15,color: Colors.black,fontWeight: FontWeight.bold ),
        dialogInsetPadding: EdgeInsets.all(50),
        blurredBackground: true,

      ),
    );
  }

  List<TableEvent> _list(snapshot){

    List<TableEvent> machineReservationTime = [];



    /*List<String> machineReservationStartTimeHour = snapshot.data.machine_reservation_StartTime_hour;
    List<String>  machineReservationStartTimeMinute = snapshot.data.machine_reservation_StartTime_minute;
    List<String>  machineReservationEndTimeHour = snapshot.data.machine_reservation_EndTime_hour;
    List<String>  machineReservationEndTimeMinute = snapshot.data.machine_reservation_EndTime_minute;*/

    for(int i =0;i<snapshot.data.length;i++){
      machineReservationTime.add(TableEvent(

        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),

        title: '',
        start: TableEventTime(
            hour: int.parse(snapshot.data[i].machine_reservation_StartTime_hour),
            minute: int.parse(snapshot.data[i].machine_reservation_StartTime_minute)
        ),
        end: TableEventTime(
            hour: int.parse(snapshot.data[i].machine_reservation_EndTime_hour),
            minute: int.parse(snapshot.data[i].machine_reservation_EndTime_minute)
        ),
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          height: 1,



        ),
        
        onTap: (){

          showDialog(context: this.context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('예약시간 확인'),
              content:  Text('${snapshot.data[i].machine_reservation_StartTime_hour}시 ${snapshot.data[i].machine_reservation_StartTime_minute}분'+ ' ~ '+'${snapshot.data[i].machine_reservation_EndTime_hour}시 ${snapshot.data[i].machine_reservation_EndTime_minute}분'),
              actions: [

                new FlatButton(
                    child: new Text("닫기"),
                    onPressed: () {
                      Navigator.pop(context);
                      print(DateTime.now());
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimerBuilder.periodic(const Duration(seconds: 1), builder: (context){
                        DateTime now = DateTime.now();
                        String formattedDate = DateFormat('yyyy년 MM월 dd일   kk시mm분').format(now);
                        return Container(
                          height: MediaQuery.of(context).size.height*0.1,
                          child: Center(
                            child: Text(formattedDate,style: MyTextStyle(size: 20),),
                          ),
                        );

                      }),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child:Row(
                                children: [
                                  Icon(Icons.timer,size: 30),
                                  Container(
                                    height:MediaQuery.of(context).size.width*0.07 ,
                                    width:MediaQuery.of(context).size.width*0.28 ,
                                    child:FittedBox(fit: BoxFit.contain,child: Text(_start_time,textAlign: TextAlign.center))
                                    ,
                                  ),
                                ],
                              ),
                              onTap: (){
                                _selectMin();
                              },
                            )
                          ],
                        )





                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.08 ,
                      width:  MediaQuery.of(context).size.width*0.08,),
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Row(
                                children: [
                                  Icon(Icons.watch_sharp, size: 30),
                                  Container(
                                      height:MediaQuery.of(context).size.width*0.07 ,
                                      width:MediaQuery.of(context).size.width*0.28 ,
                                    child:FittedBox(fit: BoxFit.contain,
                                      child: Text(_use_time,textAlign: TextAlign.center,),)

                                  ),
                                ],
                              ),

                              onTap: ()async{
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
                            )


                          ],
                        ),
                      ),


                    ],
                  )
                ],
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.55,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    FutureBuilder(
                      future: getReservation_times(DateFormat('yyyy-MM-dd').format(widget.date).toString()),
                      builder: (BuildContext context, AsyncSnapshot<List<Reservation_times>> snapshot) {
                        if (snapshot.hasData == false) {
                          return CircularProgressIndicator();
                        }

                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 2)
                        ),
                        width: MediaQuery.of(context).size.width*0.75,
                        height: MediaQuery.of(context).size.height*0.55,
                        child: TimetableView(
                          timetableStyle: TimetableStyle(
                            visibleTimeBorder: false,
                              laneColor: Colors.redAccent,
                              timeItemTextColor: Colors.black,

                              startHour: 17,
                              endHour: 23,
                              laneHeight: MediaQuery.of(context).size.height * 0.07,
                              laneWidth: MediaQuery.of(context).size.width * 0.7,
                              visibleDecorationBorder: true,

                              decorationLineDashSpaceWidth: 0,
                              decorationLineBorderColor: Colors.black,
                              timeItemWidth: 80,

                              timeItemHeight: 300,
                              timelineBorderColor: Colors.black,
                              decorationLineHeight: 300/12

                          ),
                          laneEventsList: [
                            LaneEvents(

                                lane: Lane(
                                  backgroundColor: Colors.redAccent,
                                  name: 'Power_Rack_1 '+widget.date.month.toString()+'/'+widget.date.day.toString(),
                                  width:MediaQuery.of(context).size.width * 0.5,
                                  textStyle: TextStyle(color: Colors.black,)


                                ),

                                events: _list(snapshot)
                            ),
                          ],
                        ),
                      );

                    },),


                  ],
                ),
              ),
              Column(
                children: [
                 SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                  Container(
                    child: RaisedButton(onPressed: () async {

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
                      }else  {
                        _use_time = _use_time.split('분').first;
                        List selected_time_list = _start_time.split(" ");
                        String reservation_hour = selected_time_list[0].split('시').first;
                        String reservation_min = selected_time_list[1].split('분').first;

                        TimeOfDay seltime = TimeOfDay(hour: int.parse(reservation_hour), minute:  int.parse(reservation_min));
                        DateTime Time_variable = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, seltime.hour, seltime.minute);
                        Time_variable = Time_variable.add(Duration(minutes: int.parse(_use_time)) );
                        print(Time_variable.minute.toString());

                        print(DateFormat.yMd().format(DateTime.now()).toString());
                        print(widget.date.toString().split(" ").first);
                        print(reservation_hour+':'+reservation_min);
                        print( Time_variable.hour.toString()+':'+Time_variable.minute.toString());

                        postMachineReservation(
                            1234.toString(),
                            '${widget.date.toString().split(" ").first.toString()}',
                            '$reservation_hour'+':'+'$reservation_min',
                            Time_variable.hour.toString()+':'+Time_variable.minute.toString());
                        setState(() {});

                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('완료 메세지'),
                            content:  Text('예약완료'),
                            actions: [

                              new FlatButton(
                                  child: new Text("확인"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    print(DateTime.now());
                                  })
                            ],
                          );
                        }
                        );

                      }

                    },child: Text('예약하기'),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      )

    );
  }

}
