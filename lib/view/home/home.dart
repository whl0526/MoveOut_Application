
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
                  child: CircularProgressIndicator(color: Colors.yellow[500],),
                )
              ],
            )
          );
        }
        return Container(
          color: Colors.white12,
          height: MediaQuery.of(context).size.height * 0.8,
          child:SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),

          child:Column(
            children: <Widget>[
              Container(
                //color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width*1,
                      decoration: BoxDecoration(
                         // border: Border.all(
                          //width: 1,
                         // color:Colors.white,
                       //  ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          bottomRight: Radius.circular(22),
                        ),
                        color:Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius:35,
                            offset: Offset(5,5),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          BoxShadow(
                            blurRadius:35,
                            offset: Offset(-5,-5),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.175,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://cdnweb01.wikitree.co.kr/webdata/editor/202104/19/img_20210419150500_0107e5e5.webp'))),
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
                                      fontSize: 35),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                                FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    '#'+snapshot.data!.userid ,
                                    style: TextStyle(
                                      fontSize:20,
                                      color:Colors.black54,
                                      ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),


                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04),

                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////1번째 박스
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height*0.15,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5,
                                  color:Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(12.5),
                                color:Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius:35,
                                    offset: Offset(5,5),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  BoxShadow(
                                    blurRadius:35,
                                    offset: Offset(-5,-5),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child:Column(
                                  children: [
                                     Row(

                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.39,
                                          child: Column(
                                            children: [
                                              Text(
                                                '이용중인 헬스장',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black54,),
                                              ),
                                              Container(
                                                height: MediaQuery.of(context).size.height * 0.099,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("images/wellsfit.png"),
                                                  ),
                                                ),
                                    ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.45,
                                          child: Column(
                                            children: [
                                              FittedBox(
                                                fit: BoxFit.cover,
                                                child:   Text(
                                                  snapshot.data!.start_date+' ~ '+snapshot.data!.end_date,
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontSize: 15,
                                                  ),
                                              ),

                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context).size.height * 0.009),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '남은기간 : ',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,),
                                            ),
                                            Text(
                                              ' XX ',
                                              style: TextStyle(
                                                fontSize:15,
                                                color: Colors.redAccent,)
                                              ,
                                            ),
                                            Text(
                                              '일',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,)
                                              ,
                                            ),
                                          ],
                                        ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ),
                            ),
                            Container(
                              margin:const EdgeInsets.only(top: 12),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height*0.15,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5,
                                  color:Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(12.5),
                                color:Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius:35,
                                    offset: Offset(5,5),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  BoxShadow(
                                    blurRadius:35,
                                    offset: Offset(-5,-5),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ],
                              ),
                              child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(43, 10, 18, 7),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('현재 이용자 수',style: TextStyle(color: Colors.black54,
                                            fontSize: 12,
                                           ),),
                                        Text('   코로나 N단계 수용가능 인원수',style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(

                                        width: MediaQuery.of(context).size.width * 0.125,
                                        height: MediaQuery.of(context).size.height*0.075,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.5,
                                            color: Colors.redAccent,
                                          ),
                                          borderRadius: BorderRadius.circular(100),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius:35,
                                              offset: Offset(5,5),
                                              color: Colors.grey.withOpacity(0.01),
                                            ),
                                            BoxShadow(
                                              blurRadius:35,
                                              offset: Offset(-5,-5),
                                              color: Colors.grey.withOpacity(0.01),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:[
                                            Text('N',textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                              ),
                                            ),

                                          ],
                                        ),
                                        ),



                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.125,
                                        height: MediaQuery.of(context).size.height*0.075,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.5,
                                            color: Colors.redAccent,
                                          ),
                                          borderRadius: BorderRadius.circular(100),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius:35,
                                              offset: Offset(5,5),
                                              color: Colors.grey.withOpacity(0.01),
                                            ),
                                            BoxShadow(
                                              blurRadius:35,
                                              offset: Offset(-5,-5),
                                              color: Colors.grey.withOpacity(0.01),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:[
                                            Text('N',textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:const EdgeInsets.only(top: 12),
                              height: MediaQuery.of(context).size.height*0.15,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5,
                                  color:Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(12.5),
                                color:Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius:35,
                                    offset: Offset(5,5),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  BoxShadow(
                                    blurRadius:35,
                                    offset: Offset(-5,-5),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(43, 10, 40, 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PT (김태엽T)',

                                      style:TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('9 - 10 (금)',style:TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                        ),
                                        Text( '하체수업',style:TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.125,
                                          height: MediaQuery.of(context).size.height*0.075,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.5,
                                              color: Colors.redAccent,
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius:35,
                                                offset: Offset(5,5),
                                                color: Colors.grey.withOpacity(0.01),
                                              ),
                                              BoxShadow(
                                                blurRadius:35,
                                                offset: Offset(-5,-5),
                                                color: Colors.grey.withOpacity(0.01),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:[
                                              Text('N/15',textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
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
          ),
        );
      } ,)

    );
  }
}