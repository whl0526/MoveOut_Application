import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Null> _onReFresh() async {
    setState(() {});
    print('d');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onReFresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            // decoration: BoxDecoration(
            //   border: Border(bottom: BorderSide(color: Colors.yellow,width: 5)),
            // ),
            //위쪽 상태바 바로 아래서 시작
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),


            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                    ),
                    Spacer(),
                    Text('비켜!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black)),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.gps_fixed,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.yellow, width: 5),
                                    top: BorderSide(
                                        color: Colors.yellow, width: 5),
                                    right: BorderSide(
                                        color: Colors.yellow, width: 5),
                                    left: BorderSide(
                                        color: Colors.yellow, width: 5)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "김민석",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            height: 100,
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.yellow, width: 5),
                                      right: BorderSide(
                                          color: Colors.yellow, width: 5),
                                      left: BorderSide(
                                          color: Colors.yellow, width: 5)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "회원번호 : 5581",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "회원번호를 타인과 공유하지마세용",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700]),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                          ))
                        ],
                      ),
                      SizedBox(height: 70),
                     Row(
                       children: [
                         Expanded(
                           child:Container(
                             margin: EdgeInsets.all(10),
                             child: Column(
                               children: [
                                 Row(children: [
                                   Text('1. 헬스장',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)
                                 ],),Row(children: [
                                   Text('  -  2021-07-01 ~ 2021-08-01 / 30회 이용가능',style: TextStyle(fontSize: 15,color: Colors.black))
                                 ],),
                                 SizedBox(height: 10,),
                                 Row(children: [
                                   Text('2. PT(김태엽 T)',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)
                                 ],),Row(children: [
                                   Text('  - 15회 이용가능',style: TextStyle(fontSize: 15,color: Colors.black))
                                 ],),
                                 SizedBox(height: 10,),
                                 Row(children: [
                                   Text('3. GX(싸이클)',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)
                                 ],),Row(children: [
                                   Text('  -  2021-06-01 ~ 2021-09-01 / 72회 이용가능',style: TextStyle(fontSize: 15,color: Colors.black))
                                 ],)
                               ],
                             ),
                           ),
                         )
                       ],
                     )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: 0,
        backgroundColor: Colors.black,
        color: Colors.yellow[500],
        activeColor: Colors.yellow[700],
        elevation: 1,
        curveSize: 80,
        // 동그라미를 감싸는 커브 각도
        top: -30,
        // 동그라미 사이즈
        height: 40,
        // 탭 높이
        items: [
          TabItem(
            icon: Icons.home,
          ),
          TabItem(
              icon: Image.asset(
            "icons/reservation-icon-5.jpg",
            color: Colors.yellow[500],
          )),
          TabItem(icon: Icons.person),
        ],
      ),
    );
    throw UnimplementedError();
  }
}
