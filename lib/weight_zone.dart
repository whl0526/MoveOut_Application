import 'package:flutter/material.dart';
import 'package:move_application/style/text_style.dart';
import 'package:move_application/power_rack_1.dart';

import 'appbar.dart';

class weight_zone extends StatefulWidget{
  @override
  _weight_zone createState() => _weight_zone();

}

class _weight_zone extends State<weight_zone> {
  int Today = DateTime.now().day;
  int Tomorrow =DateTime.now().add(const Duration(days: 1)).day;
  int The_day_after_tomorrow = DateTime.now().add(const Duration(days: 2)).day;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('웨이트'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                      child: Text('Power Rack 1'),
                      onPressed: ()async{
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


                      }
                  ),RaisedButton(
                      child: Text('Power Rack 2'),
                      onPressed: (){ }
                  ),RaisedButton(
                      child: Text('lower body machine 1'),
                      onPressed: (){ }
                  ),RaisedButton(
                      child: Text('lower body machine 2'),
                      onPressed: (){ }
                  ),RaisedButton(
                      child: Text('lower body machine 3'),
                      onPressed: (){ }
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}