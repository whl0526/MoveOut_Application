import 'package:flutter/material.dart';
import 'package:move_application/models/get_board_one.dart';
import 'package:move_application/models/get_comments.dart';
import 'package:move_application/style/drag_animation.dart';
import 'package:move_application/style/snapshot_no_data.dart';
import 'package:move_application/style/red_container.dart';
import 'package:move_application/view/appbar.dart';

class posts extends StatefulWidget {
  final int post_id;

  posts({required this.post_id});

  @override
  _posts createState() => _posts();
}

class _posts extends State<posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar("게시글"),
        body: FutureBuilder(
          future: getBoardOne(widget.post_id),
          builder: (BuildContext context, AsyncSnapshot<Board_one> snapshot) {
            if (snapshot.hasData == false) {
              return snapshotNoData();
            }
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Text('작성자 :' + snapshot.data!.userid),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Text(snapshot.data!.title),
                ),
                Expanded(
                  flex: 3,
                  child: Text(snapshot.data!.content),
                ),
                Expanded(
                    flex: 4,
                    child: FutureBuilder(
                      future: getcomments(widget.post_id),
                      builder: (BuildContext context,AsyncSnapshot<List<Comment>> snapshot) {
                        if (snapshot.hasData == false) {
                          return snapshotNoData();
                        }
                        
                        if(snapshot.data!.length!=0) {
                          return ListView.builder(
                            itemBuilder: (BuildContext _context, int i) {
                              return Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 0.5,
                                        color:Colors.black,),
                                    ),
                                  ),
                                  child:ListTile(
                                    title: Text(snapshot.data!.elementAt(i).userid),
                                    subtitle: Text(snapshot.data!.elementAt(i).comment),
                                    trailing: Text(snapshot.data!.elementAt(i).datetime),
                                  )
                              );
                            },
                            itemCount: snapshot.data!.length,
                            scrollDirection: Axis.vertical,
                          );
                        }
                        else return Center(
                          child: Text('댓글이 없습니다')
                        );
                        
                      },
                    )),
              ],
            );
          },
        ));
  }
}
