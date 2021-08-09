

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:move_application/appbar.dart';
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
class Power_Rack_1 extends StatefulWidget{
  final String day;
  Power_Rack_1({required this.day});

  @override
  _Power_Rack_1 createState() => _Power_Rack_1();
}
class _Power_Rack_1 extends State<Power_Rack_1>{



  List<TableEvent> _list()  {
    List<TableEvent> a = [];
    for(int i =0;i<7;i++){
      a.add(TableEvent(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        margin: EdgeInsets.zero,
        title: '',
        start: TableEventTime(hour: i+10, minute: 0),
        end: TableEventTime(hour: i+10, minute: visibleRange+8),
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,

        ),
        onTap: (){
          showDialog(context: this.context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('예약시간 확인'),
              content:  Text('${i}'+'시00분 ~ '+'${i}'+'시'+ '${visibleRange+8}'+'분'+widget.day),
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
    return a;
  }


  Future _selectMin() async {
    TimeOfDay? pick_min =
    await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      helpText: '원하는 시작 시간을 선택하세요',

      initialEntryMode: TimePickerEntryMode.input,
      useRootNavigator: false
    );

    if (pick_min != null)
      setState(() => _min =
          pick_min.hour.toString() + '시' + pick_min.minute.toString() + '분');
  }

  Future<Null> _onReFresh() async {
    setState(() {});
  }

  final BlendMode? backgroundBlendMode = BlendMode.darken;
  DateTime _month = DateTime.now();
  DateTime _initDate = DateTime.now();
  String _min = '시작 시간 선택';
  int visibleRange = 7;
  String ae = '이용 시간 선택';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
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

                    Container(
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

                                name: 'Power_Rack_1( 8/6일 )',
                                width:MediaQuery.of(context).size.width * 0.4,
                                textStyle: TextStyle(color: Colors.black,),


                              ),
                              events: _list()
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          IconButton(icon: Icon(Icons.timer,size: 30), onPressed: () async {
                            _selectMin();
                          },),
                          Container(
                            child: Text(_min),
                          ),
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
                                            child: new Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              ae = selectedRadio.toString();
                                              setState(() {
                                                if(ae== "0")ae= '5분';
                                                else if(ae == "1"){
                                                  ae= '10분';
                                                } else if(ae == "2"){
                                                  ae= '15분';
                                                } else if(ae == "3"){
                                                  ae= '20분';
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
                            child: Text(ae),
                          ),

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
