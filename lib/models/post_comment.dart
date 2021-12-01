import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


postComment(
    String postId, String userid, String comment) async {
  String apiAddr = 'http://3.130.113.238:5000/comments/$postId';
  Response response; //http request의 결과 즉 api 호출의 결과를 받기 위한 변수
  var data;

  response = await http.post(apiAddr,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "userid": userid,
        "comment": comment,
      })); //필요 api 호출

  if(response.statusCode == 200){
    return "댓글 작성 완료";
  }
  else return "실패";
}
