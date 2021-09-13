import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:move_application/style/red_container.dart';
import 'package:move_application/view/HomePage.dart';
import 'package:move_application/models/get_reservation_list.dart';
import 'package:move_application/style/text_style.dart';
import 'package:move_application/models/delete_reservation_list.dart';

class Info extends StatefulWidget{
  @override
  _Info createState() => _Info();
}


class _Info extends State<Info> {
  Future<Null> _onReFresh() async {
    setState(() {});
  }

  late Future<List<Reservation_list>> a;

  @override
  void initState(){
    super.initState();
  }

  static const List<String> _my_reservation = [
    '벤치',
    '파워 렉',
    '레그 익스텐션',
    '레그 익스텐션',
    '레그 익스텐션',
  ];
  static const List<String> _my_class = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:RefreshIndicator(
        onRefresh: _onReFresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(

                  width: MediaQuery.of(context).size.width*0.95,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Colors.yellow,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius:30,
                          offset: Offset(5,5),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        BoxShadow(
                          blurRadius:30,
                          offset: Offset(-5,-5),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                              children: [
                                Text('예약 기구',
                                  style:TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),),
                              ],
                            ),
                        ),
                        FutureBuilder<List<Reservation_list>>(
                            future:getReservationList(1234),
                            builder: (context, snapshot) {
                              if (snapshot.hasData == false) {
                                return SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.36,
                                );
                              }
                              return Container(
                                height: MediaQuery.of(context).size.height * 0.36,
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                ),
                                child:ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (BuildContext _context, int i){
                                    return ListTile(
                                      trailing:
                                      RedRoundedActionButton(text:'취소', callback: () async {
                                        showDialog(context: context, builder: (BuildContext context){
                                          return AlertDialog(
                                            content: Text('예약 취소 하시겠습니까?',textAlign: TextAlign.center,),
                                            title: Text('알림'),
                                            buttonPadding: EdgeInsets.all(10),

                                            actions: [
                                              FlatButton(onPressed: (){Navigator.pop(context);}, child: Text('창 닫기')),
                                              FlatButton(onPressed: () async {
                                                Response response = await deleteReservationList(snapshot.data!.elementAt(i).userid, snapshot.data!.elementAt(i).equipment, snapshot.data!.elementAt(i).date);
                                                if(response.statusCode == 200){
                                                  Navigator.pop(context);
                                                  setState(() {});
                                                }
                                              }, child: Text('확인'))
                                            ],
                                          );
                                        });

                                      }, botton_height: 0.007,
                                          botton_width: 0.025, font_size:13,
                                          botton_color: Colors.white12,),
                                      leading: Image.asset(
                                        "icons/${snapshot.data!.elementAt(i).equipment}.jpg",height: 55,),
                                      title: Text(snapshot.data!.elementAt(i).equipment.toString()+'     '+snapshot.data!.elementAt(i).date.toString()),
                                      subtitle: Text(snapshot.data!.elementAt(i).start_time.toString()+' ~ '+snapshot.data!.elementAt(i).end_time.toString(),style:TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 15.5,
                                      ),),
                                    );
                                  },
                                ) ,
                              );
                            }),

                      ],
                    ),

                  ),

                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02),





                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 23.0),
                        child: Row(
                          children: [
                            Text('수업일지',style:TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    _my_class.isEmpty
                        ? Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('예정된 수업이 없습니다.',textAlign: TextAlign.center,style: TextStyle(fontSize: 21),)
                        ],
                      ),
                    )
                        :Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                        itemCount: _my_reservation.length,
                        itemBuilder: (BuildContext _context, int i){
                          if(_my_class.isEmpty)return Text('예정된 수업이 없습니다');
                          return ListTile(
                            leading: Image.asset(
                              "icons/exercise.png",color: Colors.red[700],height: 45,),
                            title: Text(_my_reservation[i],),
                            subtitle: Text('n시 m분 ~ n시 m분',style: TextStyle(fontSize: 17),),
                          );
                        },
                      ),
                    ) ,
                  ],
                ),
              ],
            ),
          ),
        ),
      )

    );
  }
}