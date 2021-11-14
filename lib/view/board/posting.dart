import 'package:flutter/material.dart';
import 'package:move_application/models/post_postingBoard.dart';
import 'package:move_application/style/red_container.dart';
import 'package:move_application/view/appbar.dart';
import 'package:move_application/view/board/categories/cloth.dart';


class posting extends StatefulWidget{
  final String categoty;
  posting({required this.categoty});
  @override
  _posting createState() => _posting();
}



class _posting extends State<posting> {
  String Food = 'food';
  String Title ="";
  String Content ="";
  final RegExp _regExp = RegExp(r'[\uac00-\ud7af]', unicode: true);
//0= 타이틀,1=내용,2=이미지
  List<String> post_variable = ['','','',''];
  Widget customTextField(@required int textVariable,String hintText){
    return Container(
        width: MediaQuery.of(context).size.width*0.8,
        child: TextField(
          onChanged: (text) => post_variable[textVariable]=text,
          decoration: InputDecoration(

            // border:InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintText: hintText
          ),
        )
    );

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: CustomAppbar("글쓰기"),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField(0,"제목을 입력하세요"),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width*0.8,
              child: TextField(

                onChanged: (text) => post_variable[1]=text,
                expands: true,
                minLines: null,
                maxLines: null,
                maxLength: 500,
                decoration: InputDecoration(

                  // border:InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    hintText: "내용을 입력하세요"
                ),
              ),
            ),

            customTextField(2,"사진을 골라주세요"),
            Container(
              width: MediaQuery.of(context).size.width*0.7,
              child: Text('image picker들어갈 자리'),
            ),

            Center(
              child: RedRoundedActionButton(
                callback:() async {
                  print(postBoard( 1234.toString(),Food, "none", post_variable[1], post_variable[0]));
                  final router = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => cloth(space_name: "운동복",)));
                },
                botton_height: 0.02,
                text: "작성",
                botton_color: Colors.redAccent,
                font_size: 13,
                botton_width: 0.02,
              ),
            )

          ],
        ),
      )

    );
  }
}
