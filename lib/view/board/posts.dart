import 'package:flutter/material.dart';
import 'package:move_application/style/red_container.dart';
import 'package:move_application/view/appbar.dart';


class posts extends StatefulWidget{

  @override
  _posts createState() => _posts();
}

class _posts extends State<posts>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("게시글"),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Text("이름(ID)"),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child:Text("제목"),
          ),
          Expanded(
            flex:3,
              child:Text("내용 (안에 사진 첨부되어야함)")
              ,),
          Expanded(
            flex:4,
            child: ListView.builder(
              itemBuilder: (BuildContext _context, int i){
                return ListTile(
                  title: Text('댓글들.'),
                  onTap: ()async{
                    final router  = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => posts()));
                  },
                );
              },
              itemCount: 10,
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

}