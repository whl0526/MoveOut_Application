
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class Comment{
  late int b_id;
  late String comment;
  late String datetime;
  late int id;
  late String userid;



  Comment({
    required this.b_id,
    required this.comment,
    required this.datetime,
    required this.id,
    required this.userid,

  });
}



Future<List<Comment>> getcomments(postId) async{
  String apiAddr =
      'http://3.130.113.238:5000/comments/${postId}';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수

  var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.



  response = await http.get(apiAddr);//필요 api 호출
  data1 = json.decode(response.body);//받은 정보를 json형태로 decode

  List<Comment>  commemts= [];
  for(int i=0;i<data1.length;i++){
    commemts.add(
        Comment(
          b_id: data1.elementAt(i)["b_id"],
          comment: data1.elementAt(i)["comment"],
          datetime: data1.elementAt(i)["datetime"],
          id: data1.elementAt(i)["id"],
          userid: data1.elementAt(i)["userid"],
        )
    );
  }

  return commemts;
}