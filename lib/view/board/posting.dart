import 'package:flutter/material.dart';
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
  String title ="";
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CustomAppbar("글쓰기"),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            child:customTextField(
              Title,title,'제목을 입력해주세요',
            ),
          ),
          Container(
            height:50,
            width: 20,
            child: InkWell(
              onTap: (){
                setState(() {});
                print(title);},
            ),
          ),

          Center(
            child: Text("내용"),
          ),
          Center(
            child: Text("사진업로드"),
          ),
          Center(
            child: Text("글쓰기"),
          ),
          
        ],
      ),
    );
  }
}
