import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class LoginIdPw {
  late String result;
  late String access_token;


  LoginIdPw({
    required this.result,

    required this.access_token,
  });
}


Future<LoginIdPw> postLogin(userId,password) async{


  String apiAddr =
      'http://3.130.113.238:5000/login';

  var data;

  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수

  response = await http.post(apiAddr,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"userid":userId,"password":password})

      );//필요 api 호출

  data = json.decode(response.body);
  LoginIdPw loginIdPw;
  loginIdPw = LoginIdPw(
      result: data["resualt"],
      access_token: data["access_token"]
  );

  return loginIdPw;
}