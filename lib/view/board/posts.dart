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
                child: Text("이지은님"),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child:Text("제목"),
          ),
          Expanded(
            flex:3,
            child: ListView.builder(

              itemBuilder: (BuildContext _context, int i){
                return Container(

                  child: Text('댓글들.'),

                );
              },
              itemCount: 10,
              scrollDirection: Axis.vertical,
            ),
          ),
          Expanded(
            flex:4,
            child: ListView.builder(

              itemBuilder: (BuildContext _context, int i){
                return ListTile(

                  title: Text('댓글들.'),
                  trailing: Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(flex:1,child: Container(child: Text('대댓글'),)),
                            Expanded(flex:1,child: Container(child: Text('좋아요'),)),
                            Expanded(flex:1,child: Container(child: Text('...'),)),
                          ],
                        )
                      ],
                    ),
                  ),
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