
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
          height: MediaQuery.of(context).size.height * 0.75,
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
                      margin:const EdgeInsets.only(top: 15),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width*1,
                      decoration: BoxDecoration(
                         // border: Border.all(
                          //width: 1,
                         // color:Colors.white,
                       //  ),
                        borderRadius: BorderRadius.circular(12.5),
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
                            width: MediaQuery.of(context).size.width*0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.18,
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
                            width: MediaQuery.of(context).size.width*0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data!.user_name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
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
                        height: MediaQuery.of(context).size.height * 0.02),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(

                          children: [
                            Container(
                              padding: EdgeInsets.zero,

                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height*0.265,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
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

                                          width: MediaQuery.of(context).size.width*0.4,
                                          height: MediaQuery.of(context).size.height*0.2,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context).size.height * 0.2,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: AssetImage("images/wellsfit.png"),
                                                  ),
                                                ),
                                    ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.4,
                                          height: MediaQuery.of(context).size.height*0.2,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '이용중인 헬스장',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black54,)
                                                ,
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                                              FittedBox(
                                                fit: BoxFit.cover,
                                                child: Text(
                                                  'WELLS FIT',style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child:Column(
                                            children: [
                                              Text(
                                                snapshot.data!.start_date+' ~ '+snapshot.data!.end_date,
                                                style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontSize: 18,
                                                    ),
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
                              margin:const EdgeInsets.only(top: 10),
                              height: MediaQuery.of(context).size.height*0.19,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
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
                                    EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('현재 이용자 수',style: TextStyle(color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),),
                                        Text('/    코로나 가능 인원수',style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))
                                      ],
                                    ),

                                  ),
                                  Row(
                                    children: [
                                      Container(

                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:const EdgeInsets.only(top: 10),
                              height: MediaQuery.of(context).size.height*0.19,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
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
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
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
          ),
        );
      } ,)

    );
  }
}