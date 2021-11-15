import 'package:flutter/material.dart';

import 'package:move_application/view/board/categories/food.dart';
import 'package:move_application/view/board/categories/cloth.dart';
import 'package:move_application/view/board/categories/method.dart';
import 'package:move_application/view/board/categories/freetalk.dart';

class BoardCategory extends StatefulWidget{
  @override
  _BoardCategory createState() => _BoardCategory();

}

class _BoardCategory extends State<BoardCategory>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async{
                        final abc  = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) => cloth(space_name:'식단',)));
                      },
                      child:  buildCategory("images/board-categories/food.jpg", "식단", "다이어트,벌크업 식단, etc"),
                    ),InkWell(
                      onTap: () async{
                        final abc = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) => cloth(space_name:'운동복')));
                      },
                      child:  buildCategory("images/board-categories/cloth.jpg", "운동복", "추천의류, 할인상품 etc"),
                    ),
                    InkWell(
                      onTap: () async{
                        final abc = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) => method(space_name:'운동방법')));
                      },
                      child:  buildCategory("images/board-categories/method.jpg", "운동방법", "운동루틴, 추천운동 etc"),
                    ),
                    InkWell(
                      onTap: () async{
                        final abc = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) => freetalk(space_name:'자유게시판')));
                      },
                      child:  buildCategory("images/board-categories/freetalk.jpg", "자유게시판", ""),

                    ),
                  ],
                ),
              ],

        ),
      ),
    );
  }

  Widget buildCategory(String imageUrl, String title, String subtitle) {
    return Container(
      width: (MediaQuery.of(context).size.width)*0.8,
      height: (MediaQuery.of(context).size.height)*0.15,
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
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              child: Image.asset(imageUrl, fit: BoxFit.fill,),
              aspectRatio: 1 / 0.6,
            ),
            SizedBox(
              width:MediaQuery.of(context).size.width*0.05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style:(
                    TextStyle(color: Colors.black87,
                        fontSize: 21,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height*0.01,
                ),
                Text(subtitle,style:(
                    TextStyle(color: Colors.black54,
                        fontSize: 10,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600)),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}