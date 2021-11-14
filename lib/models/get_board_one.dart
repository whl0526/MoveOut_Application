
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Board_one{
  late String category;
  late String content;
  late String datetime;
  late int id;
  late String image;
  late String title;
  late String userid;

  Board_one({
    required this.category,
    required this.content,
    required this.datetime,
    required this.id,
    required this.image,
    required this.title,
    required this.userid,
  });
}

Future<Board_one> getBoardOne(int board_id) async{
  String apiAddr =
      'http://3.130.113.238:5000/board_one/${board_id}';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수
  var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.
  Board_one board_one;


  response = await http.get(apiAddr);//필요 api 호출
  data1 = json.decode(response.body);//받은 정보를 json형태로 decode



  //받은 데이터정보를 필요한 형태로 저장한다.
  board_one = Board_one(

    category: data1["category"],
    content: data1["content"],
    datetime: data1["datetime"],
    id: data1["id"],
    image: data1["image"],
    title:  data1["title"],
    userid: data1["userid"],

  );

  return board_one;
}