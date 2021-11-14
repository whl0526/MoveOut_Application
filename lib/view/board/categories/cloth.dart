import 'package:flutter/material.dart';
import 'package:move_application/models/get_board_all.dart';
import 'package:move_application/style/red_container.dart';
import 'package:move_application/style/snapshot_no_data.dart';
import 'package:move_application/view/appbar.dart';
import 'package:move_application/view/board/posting.dart';
import 'package:move_application/view/board/posts.dart';

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
      appBar: CustomAppbar(widget.space_name),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: RedRoundedActionButton(
                  botton_width: 0.04,
                  font_size: 16,
                  botton_color: Colors.red,
                  text: "글쓰기",
                  botton_height: 0.02,
                  callback: () async {
                    final router = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => posting(
                                  categoty: '운동복',
                                )));
                  },
                ),
              )
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
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 0.5,
                                color:Colors.black,),
                            ),
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
