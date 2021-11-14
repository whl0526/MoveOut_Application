
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Board_all{
  late String datetime;
  late String head;
  late int id;
  late String image;
  late String title;
  late String userid;


  Board_all({
    required this.datetime,
    required this.head,
    required this.id,
    required this.image,
    required this.title,
    required this.userid,

  });
}



Future<List<Board_all>> getBoardAll(String category) async{
  String apiAddr =
      'http://3.130.113.238:5000/board_all/${category}';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수

  var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.



  response = await http.get(apiAddr);//필요 api 호출
  data1 = json.decode(response.body);//받은 정보를 json형태로 decode
  print( data1.elementAt(0)["datetime"]);
  List<Board_all>  board_all= [];
  for(int i=0;i<data1.length;i++){
    board_all.add(
        Board_all(
          datetime: data1.elementAt(i)["datetime"],
          head: data1.elementAt(i)["head"],
          id: data1.elementAt(i)["id"],
          image: data1.elementAt(i)["image"],
          title: data1.elementAt(i)["title"],
          userid: data1.elementAt(i)["userid"],
        )
    );
  }

  return board_all;
}