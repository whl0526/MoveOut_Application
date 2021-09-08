
import 'package:flutter/material.dart';
import 'package:move_application/models/get_member_info.dart';
import 'package:move_application/style/text_style.dart';


class home extends StatelessWidget{


  Widget build(BuildContext context){

    return Scaffold(
      body:FutureBuilder(
        future: getMemberInfo(1234),builder:(BuildContext context,
          AsyncSnapshot<Member_info> snapshot) {

        if (snapshot.hasData == false) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(color: Colors.black,),
                )
              ],
            )

          );
        }
        return Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child:Column(
            children: <Widget>[
              Container(

                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      decoration: BoxDecoration(
                        color: Colors.yellow[300],
                      ),

                      child: Row(

                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                  MediaQuery.of(context).size.height * 0.2,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://yt3.ggpht.com/ytc/AKedOLTrg1TdPY-UQFlUQNtjFRrHCmtHsQbZNsAZnDlW=s900-c-k-c0x00ffffff-no-rj'))),
                                )
                              ],
                            ),
                          ),
                          Container(

                            width: MediaQuery.of(context).size.width*0.4,


                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data!.user_name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                                FittedBox(

                                  fit: BoxFit.cover,
                                  child: Text(
                                    '회원번호 : '+snapshot.data!.userid ,style: TextStyle(fontSize:25, fontWeight: FontWeight.bold,),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.1,
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height*0.09,
                              decoration: BoxDecoration(
                                  border:Border.all(
                                      width: 2, color: Colors.black
                                  ),
                                  color: Colors.yellow.shade300,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(15, 5, 50, 5),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'WELLSFIT . 웰스핏',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height*0.12,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: 2, color: Colors.black),
                                  left:  BorderSide(width: 2, color: Colors.black),
                                ),
                                color: Colors.yellow.shade300,

                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(15, 5, 15, 5),
                                    child: Text(
                                      snapshot.data!.start_date+' ~ '+snapshot.data!.end_date,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(15, 5, 15, 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('현재 이용자 수',style: TextStyle(color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),),
                                        Text('N / 코로나 가능 인원수',style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height:70,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Colors.black),
                                  color: Colors.yellow.shade300,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PT (김태엽T)',

                                      style: MyTextStyle(size: 20),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.005,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('07 - 23',style: MyTextStyle(size: 15),),
                                        Text( '하체수업                     ',style: MyTextStyle(size: 15),),
                                        Text(
                                          'n/15회',style: MyTextStyle(size: 15),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      } ,)

    );
  }
}