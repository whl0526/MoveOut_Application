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
  String comment = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar("게시글"),
        body: FutureBuilder(
          future: getBoardOne(widget.post_id),
          builder: (BuildContext context, AsyncSnapshot<Board_one> snapshot) {
            List<String> image = [];

            if (snapshot.hasData == false) {
              return snapshotNoData();
            }
            if (snapshot.data!.image != "") {
              image = snapshot.data!.image.split(",");
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
                (snapshot.data!.image != "")
                    ? Expanded(
                        flex: 4,
                        child: Center(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: image.length - 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.5,
                                      color: Colors.yellow,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1)),
                                    color: Colors.white,
                                  ),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          print('ad');
                                        },
                                        child: Image.network(
                                            image.elementAt(index)),
                                      ),
                                      Positioned(
                                          bottom: 10,
                                          right: 10,
                                          child: Container(
                                            color: Colors.white,
                                            child: Text((index + 1).toString() +
                                                '/' +
                                                image.length.toString()),
                                          )),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        /*child: Image.network(
                          snapshot.data!.image,
                          fit: BoxFit.fill,
                        )*/
                      )
                    : Container(),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 0, 0, 5),
                    child:  Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              onChanged: (text) => comment = text,
                              decoration: InputDecoration(

                                // border:InputBorder.none,
                                  contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                                  hintText: "댓글달기"),
                            )),
                        InkWell(
                          child: Container(
                            child: Text('댓글달기'),
                          ),
                          onTap: () async{
                            

                          },
                        )
                      ],
                    ),

                  )
                ),
                Expanded(
                    flex: 4,
                    child: FutureBuilder(
                      future: getcomments(widget.post_id),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Comment>> snapshot) {
                        if (snapshot.hasData == false) {
                          return snapshotNoData();
                        }

                        if (snapshot.data!.length != 0) {
                          return ListView.builder(
                            itemBuilder: (BuildContext _context, int i) {
                              return Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 0.5,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                        snapshot.data!.elementAt(i).userid),
                                    subtitle: Text(
                                        snapshot.data!.elementAt(i).comment),
                                    trailing: Text(
                                        snapshot.data!.elementAt(i).datetime),
                                  ));
                            },
                            itemCount: snapshot.data!.length,
                            scrollDirection: Axis.vertical,
                          );
                        } else
                          return Center(child: Text('댓글이 없습니다'));
                      },
                    )),
              ],
            );
          },
        ));
  }
}
