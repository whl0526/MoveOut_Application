import 'package:flutter/material.dart';
import 'package:move_application/models/get_board_all.dart';
import 'package:move_application/style/red_container.dart';
import 'package:move_application/style/snapshot_no_data.dart';
import 'package:move_application/view/appbar.dart';

import 'package:move_application/view/board/posting.dart';
import 'package:move_application/view/board/posts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class cloth extends StatefulWidget {
  final String space_name;

  cloth({required this.space_name});

  @override
  _cloth createState() => _cloth();
}

class _cloth extends State<cloth> {
  int ItemCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(widget.space_name+' 게시판'),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(

                child: RaisedButton(
                    color:Colors.white,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.5),
      ),
                    onPressed: ()async {
        final router = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => posting(
                      categoty: '운동복',
                    )));
      },
        child: Row(
          children: [
          Icon(FontAwesomeIcons.pen,
          size:15.5,
          color:Color(0xFFBB9B9B9)),
            Text(' 글 쓰기',
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
            ),),
          ],


        )),
              ),
            ],
          ),

          FutureBuilder(
            future: getBoardAll("food"),
            builder: (BuildContext context, AsyncSnapshot<List<Board_all>> snapshot) {
              if (snapshot.hasData == false) {
                return snapshotNoData();
              }
              return Expanded(
                child: Center(
                  child: Container(
                    child: ListView.builder(
                      itemBuilder: (BuildContext _context, int i) {
                        String datetime = snapshot.data!.elementAt(i).datetime;
                        List datetimeSplite = datetime.split(' ');

                        return Container(
                          margin: EdgeInsets.fromLTRB(15,0,15,5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.5,
                                color:Colors.black54,
                              ),
                              borderRadius: BorderRadius.circular(12.5),
                              color:Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius:55,
                                  offset: Offset(5,5),
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                BoxShadow(
                                  blurRadius:55,
                                  offset: Offset(5,-5),
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                              ],
                            ),
                          child: ListTile(

                            title: Text(snapshot.data!.elementAt(i).title),
                            subtitle: Text(snapshot.data!.elementAt(i).head),
                            //snapshot.data!.elementAt(i).image == none
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('작성자 :'+snapshot.data!.elementAt(i).userid),
                                Text('작성일 :'+datetimeSplite[0].split('-')[1]+'/'+datetimeSplite[0].split('-')[2]),
                              ],
                            ),
                            onTap: () async {
                              final router = await Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => posts(post_id: snapshot.data!.elementAt(i).id,)));
                            },
                          )
                        ) ;

                      },
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                ),
              );
          },
          ),


        ],
      ),
    );
  }
}
