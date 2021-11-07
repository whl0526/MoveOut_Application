import 'package:flutter/material.dart';
import 'package:move_application/view/reservation/zone/free_weight.dart';
import 'package:move_application/view/reservation/zone/middle_weight.dart';
import 'package:move_application/view/reservation/zone/squat.dart';
import 'package:move_application/view/reservation/zone/aerobic.dart';

class Reservation extends StatefulWidget{
  @override
  _Reservation createState() => _Reservation();

}

class _Reservation extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async{
                    final res = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => aerobic(space_name:'유산소' ,)));
                  },
                  child:  buildCategory("images/reservation-images/treadmill9.jpg", "유산소 존"),
                ),InkWell(
                  onTap: () async{
                    final res = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => middle_weight(space_name:'중앙 웨이트')));
                  },
                  child:  buildCategory("images/reservation-images/bench9.jpg", "중앙 웨이트 존"),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async{
                    final res = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => squat(space_name:'하체')));
                  },
                  child:  buildCategory("images/reservation-images/squat9.jpg", "하체 존"),
                ),
                InkWell(
                  onTap: () async{
                    final res = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => free_weight(space_name:'우측 웨이트')));
                  },
                  child:  buildCategory("images/reservation-images/deadlift9.jpg", "우측 웨이트 존"),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategory(String imageUrl, String title) {
    return Container(
      width: (MediaQuery.of(context).size.width)*0.37,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.85,
          color:Colors.yellow,
        ),
        borderRadius: BorderRadius.circular(12.5),
        color:Color(0x01222C),
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
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              child: Image.asset(imageUrl, fit: BoxFit.fill,),
              aspectRatio: 1 / 0.88,
            ),
            SizedBox(
              height:MediaQuery.of(context).size.height/50,
            ),
            Text(title,style: TextStyle(
              color: Colors.black54,
            ),),
          ],
        ),
      ),
    );
  }
}