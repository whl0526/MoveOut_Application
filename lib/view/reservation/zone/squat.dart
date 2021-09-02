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
  int Today = DateTime.now().day;
  int Tomorrow =DateTime.now().add(const Duration(days: 1)).day;
  int The_day_after_tomorrow = DateTime.now().add(const Duration(days: 2)).day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(widget.space_name),
      body:Container(
        padding:EdgeInsets.all(10),
        child: Container(
            width: MediaQuery.of(context).size.width*1,
            height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 3, color: Colors.blueAccent),
              left:  BorderSide(width: 3, color: Colors.blueAccent),
              right:  BorderSide(width: 10, color: Colors.white),
            ),
          ),

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
                                            if(index == 0) Title = Today.toString();
                                            else if(index == 1) Title = Tomorrow.toString();
                                            else if(index == 2) Title = The_day_after_tomorrow.toString();
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
                                        String _selected_day='';
                                        if(selectedRadio == 0) _selected_day = Today.toString();
                                        else if(selectedRadio == 1) _selected_day = Tomorrow.toString();
                                        else if(selectedRadio == 2) _selected_day = The_day_after_tomorrow.toString();
                                        Navigator.pop(context);
                                        final res = await Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => Power_Rack_1(day:_selected_day,)));

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
                        child:  buildCategory("icons/핵 스쿼트.jpg", "핵 스쿼트"),
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

      ),







    );
  }
  Widget buildCategory(String imageUrl, String title) {
    return Container(
     width: (MediaQuery.of(context).size.width)*0.35,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.2,
          color:Colors.yellow,
        ),
        borderRadius: BorderRadius.circular(12.5),
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