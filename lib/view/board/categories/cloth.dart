import 'package:flutter/material.dart';
import 'package:move_application/style/red_container.dart';
import 'package:move_application/view/appbar.dart';
import 'package:move_application/view/board/posting.dart';
import 'package:move_application/view/board/posts.dart';

class cloth extends StatefulWidget{
  final String space_name;
  cloth({required this.space_name});
  @override
  _cloth createState() => _cloth();
}

class _cloth extends State<cloth>{

  int ItemCount = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(widget.space_name),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: RedRoundedActionButton(
                  botton_width: 0.04,
                  font_size:16 ,
                  botton_color:Colors.red ,
                  text: "글쓰기",
                  botton_height: 0.02,
                  callback: () async{
                    final router  = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => posting(categoty:'운동복',)));
                  },),
              )
            ],
          ),
          Center(
            child: Container(
              child: ListView.builder(
                itemBuilder: (BuildContext _context, int i){
                  return ListTile(
                    title: Text('게시글이 올라갈 예정입니다.'),
                    onTap: ()async{
                      final router  = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => posts()));
                    },
                  );
                },
                itemCount: ItemCount,
                scrollDirection: Axis.vertical,
              ),
              height:MediaQuery.of(context).size.height*0.5,
            ),
          )
          ,

        ],
      ),

    );
  }

}