import 'package:flutter/material.dart';
import 'package:move_application/style/red_container.dart';
import 'package:move_application/view/appbar.dart';


class posting extends StatefulWidget{
  final String categoty;
  posting({required this.categoty});
  @override
  _posting createState() => _posting();
}

Widget customTextField(@required String textVariable,String text,String hintText){
  return TextField(
    onChanged: (text) => textVariable=text,
    decoration: InputDecoration(
      // border:InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        hintText: hintText
    ),
  );
}


class _posting extends State<posting> {

  String Title ="";
  String Content ="";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CustomAppbar("글쓰기"),
      body: Column(

        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            child:TextField(
              onChanged: (text) => Title=text,
              decoration: InputDecoration(
                // border:InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  hintText: "제목을 입력하세요"
              ),
            ),
          ),



          Container(
            width: MediaQuery.of(context).size.width*0.7,
            child:TextField(
              onChanged: (text) => Content=text,
              decoration: InputDecoration(
                // border:InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  hintText: "내용을 입력하세요"
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            child:TextField(
              onChanged: (text) => Title=text,
              decoration: InputDecoration(
                // border:InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  hintText: "사진을 등록하세요"
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            child: Text('image picker들어갈 자리'),
          ),

          Center(
            child: RedRoundedActionButton(
              callback:(){
                print('제목 : '+Title + ' 내용 : '+ Content);
              },
              botton_height: 0.02,
              text: "글쓰기",
              botton_color: Colors.red,
              font_size: 13,
              botton_width: 0.02,
            ),
          )
          
        ],
      ),
    );
  }
}
