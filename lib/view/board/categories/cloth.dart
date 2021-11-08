import 'package:flutter/material.dart';
import 'package:move_application/view/appbar.dart';

class cloth extends StatefulWidget{
  final String space_name;
  cloth({required this.space_name});
  @override
  _cloth createState() => _cloth();
}

class _cloth extends State<cloth>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(widget.space_name),
      body: Column(
        children: [
          Center(
            child: Container(
              child: ListView.builder(
                itemBuilder: (BuildContext _context, int i){
                  return ListTile(
                    title: Text('게시글이 올라갈 예정입니다.'),
                  );
                },
                itemCount: 5,
                scrollDirection: Axis.vertical,
              ),
              height:MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width*0.8,
            ),
          )
          ,

        ],
      ),

    );
  }

}