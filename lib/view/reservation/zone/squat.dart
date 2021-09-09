import 'package:flutter/material.dart';
import 'package:move_application/style/text_style.dart';
import 'package:move_application/view/reservation/power_rack_1.dart';

import 'package:move_application/view/appbar.dart';

class squat extends StatefulWidget{
  final String space_name;
  squat({required this.space_name});
  @override
  _squat createState() => _squat();

}

class _squat extends State<squat> {
  DateTime Today = DateTime.now();
  DateTime Tomorrow =DateTime.now().add(const Duration(days: 1));
  DateTime The_day_after_tomorrow = DateTime.now().add(const Duration(days: 2));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(widget.space_name),
      body:Container(
        padding:EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width*1,
            height: MediaQuery.of(context).size.height * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: InkWell(
                          onTap: ()async{
                            showDialog(
                                context:context,
                                builder: (BuildContext context){
                                  int selectedRadio = 0;
                                  return AlertDialog(
                                    title: Text('예약 날짜 선택'),
                                    content: StatefulBuilder(
                                      builder: (BuildContext context,StateSetter setState){
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List<Widget>.generate(3,(int index){
                                            String Title= '';
                                            if(index == 0) Title = Today.day.toString();
                                            else if(index == 1) Title = Tomorrow.day.toString();
                                            else if(index == 2) Title = The_day_after_tomorrow.day.toString();
                                            return RadioListTile<int>(
                                              title: Text(Title+'일'),
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
                                      FlatButton(onPressed: (){ Navigator.pop(context);}, child: Text('닫기')),
                                      FlatButton(onPressed: () async {
                                        late DateTime _selected_day;
                                        if(selectedRadio == 0) _selected_day = Today;
                                        else if(selectedRadio == 1) _selected_day = Tomorrow;
                                        else if(selectedRadio == 2) _selected_day = The_day_after_tomorrow;
                                        Navigator.pop(context);
                                        final res = await Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => Power_Rack_1(date:_selected_day,)));

                                      }, child: Text('선택')),
                                    ],
                                  );
                                }
                            );

                          },
                          child: buildCategory("icons/파워 레그프레스.jpg", "파워 레그프레스"),
                        ),
                      ),InkWell(
                        onTap: () {
                        },
                        child: buildCategory("icons/스탭퍼.jpg", "힙 쓰러스트"),
                      ),
                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                        },
                        child:  buildCategory("icons/핵 스쿼트.jpg", "핵 스쿼트"),
                      ),InkWell(
                        onTap: () {
                        },
                        child:  buildCategory("icons/파워 렉.jpg", "랙"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                        },
                        child:  buildCategory("icons/핵 스쿼트.jpg", "V 스쿼트"),
                      ),InkWell(
                        onTap: () {
                        },
                        child:  buildCategory("icons/파워 렉.jpg", "랙"),
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
     width: (MediaQuery.of(context).size.width)*0.35,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.3,
          color:Colors.yellow,
        ),
        borderRadius: BorderRadius.circular(12.5),
        color:Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius:25,
            offset: Offset(5,5),
            color: Colors.grey.withOpacity(0.2),
          ),
          BoxShadow(
            blurRadius:25,
            offset: Offset(-5,-5),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              child: Image.asset(imageUrl, fit: BoxFit.fill,),
              aspectRatio: 1 / 0.9,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}