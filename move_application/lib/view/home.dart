import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';


class Reservation extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(

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


        )
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}