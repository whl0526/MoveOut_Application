import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:move_application/view/home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Null> _onReFresh() async {
    setState(() {});
    print('d');
  }

  int selectedPage = 0;
  final _pageOptions = [HomePage(),Reservation(),Reservation()];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('비켜'),
      // ),
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

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
                    Text('   비켜',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'BMHANNAPro',
                            color: Colors.black)),
                    IconButton(
                      icon: Icon(
                        Icons.doorbell_sharp,
                        color: Colors.black,
                        size: 35,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Divider(color: Colors.yellow,thickness: 2,height: 0,),
                Container(

                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   height: 30,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Container(
                      //         width: MediaQuery.of(context).size.width * 0.1,
                      //       ),
                      //       VerticalDivider(
                      //         color: Colors.yellow.shade300,
                      //         thickness: 4,
                      //       ),
                      //       Container(
                      //           width: MediaQuery.of(context).size.width * 0.0),
                      //       VerticalDivider(
                      //         color: Colors.yellow.shade300,
                      //         thickness: 4,
                      //       ),
                      //       Container(
                      //           width: MediaQuery.of(context).size.width * 0.1),
                      //     ],
                      //   ),
                      // ),
                      Stack(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            decoration: BoxDecoration(
                              color: Colors.yellow[300],
                            ),
                          ),
                          Positioned(
                              top: 65,
                              left: 25,
                              right: 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '김민석',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35),
                                  )
                                ],
                              )
                              ),
                          Positioned(
                              top: 120,
                              left: 100,
                              right: 0,
                              child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 5,),
                                      Text(
                                        '회원번호 : 5581',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),

                                    ],
                                  ))),
                          Positioned(
                              top: 50,
                              left: -240,
                              right: 0,
                              child: Container(
                                width: 0,
                                height: 140,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://yt3.ggpht.com/ytc/AKedOLTrg1TdPY-UQFlUQNtjFRrHCmtHsQbZNsAZnDlW=s900-c-k-c0x00ffffff-no-rj'))),
                              ))
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 50,
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(
                                        width: 2, color: Colors.black),
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
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(width: 2, color: Colors.black),
                                        left:  BorderSide(width: 2, color: Colors.black),
                                       ),
                                    color: Colors.yellow.shade300,

                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 5, 15, 5),
                                      child: Text(
                                        '21.07.01 ~ 21.08.01',
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
                                          Text('N / 코로나 가능 인원수',style: TextStyle(color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: 'BMHANNAPro',
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

                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '07 - 23',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '하체수업                     ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'n/15회',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),


                                    ],
                                  ),


                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.1),
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
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: 0,
        backgroundColor: Colors.white,
        color: Colors.yellow[500],
        activeColor: Colors.yellow[700],
        elevation: 3,
        curveSize: 100,
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
            scale: 30,
          )),
          TabItem(icon: Icons.person),
        ],

        onTap: (int index){
          // if(index == 1){
          //   setState(() {
          //     final res =  Navigator.push(context, MaterialPageRoute(builder: (context)=> Reservation()));
          //   });
          // }

        },
      ),
    );
    throw UnimplementedError();
  }
}
