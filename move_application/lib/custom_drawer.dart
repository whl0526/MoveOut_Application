import 'package:flutter/material.dart';
import 'package:move_application/style/text_style.dart';

class CustomDrawer extends Drawer{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.yellow,
                 borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(40.0),
                     bottomRight: Radius.circular(40.0)
                 )
            ),
            child: Text('d'),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  '비켜 이자식아',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(), //화면 우측에 아이콘 위치시킴
                IconButton(
                    onPressed: () {
                    },
                    icon: Icon(
                      Icons.share,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                          'https://scontent-ssn1-1.xx.fbcdn.net/v/t1.6435-9/53236126_1104018476388630_2980420077486080000_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=a26aad&_nc_ohc=tqunuUtxYToAX_48eBE&_nc_ht=scontent-ssn1-1.xx&oh=c0b6cfe21c02c028c20cfb215c57a328&oe=612DA428'))),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'reasley',
                  style: MyTextStyle(size: 19),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'sjms321@naver.com',
                  style: TextStyle(color: Colors.black),
                ),
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                    // Navigator.pop(context);/
                    }),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                )
              ],
            ),
          )
        ],
      ),

    );
  }


}
