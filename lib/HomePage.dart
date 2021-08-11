import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:move_application/appbar.dart';
import 'package:move_application/view/home.dart';
import 'package:move_application/view/reservation.dart';
import 'package:move_application/view/my_info.dart';
import 'package:move_application/style/text_style.dart';
import 'package:move_application/appbar.dart';
import 'custom_drawer.dart';
import 'end_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  Future<Null> _onReFresh() async {
    setState(() {});
    print('d');
  }

  int selectedPage = 0;
  final List<Widget>_pageOptions = [home(),Reservation(),Info()];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldkey,
      endDrawer: CustomEndDrawer(),
      appBar: AppBar(

        title: Text(
          '비켜',
          style: TitleStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldkey.currentState!.openEndDrawer();
            },
            icon: Icon(Icons.doorbell_sharp),
            color: Colors.black,
            iconSize: 35,
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: null,
        elevation: 0.0,
      ),
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: 0,
        backgroundColor: Colors.white,
        color: Colors.yellow[500],
        activeColor: Colors.yellow[700],
        elevation: 3,
        curveSize: 100,// 동그라미를 감싸는 커브 각도
        top: -30,// 동그라미 사이즈
        height: 40,// 탭 높이
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
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
    throw UnimplementedError();
  }
}
