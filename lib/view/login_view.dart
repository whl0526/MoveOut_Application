import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:move_application/models/login.dart';
import 'package:move_application/style/text_style.dart';
import 'package:move_application/view/HomePage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class loginView extends StatefulWidget{
  @override
  _loginView createState() => _loginView();
}
class LoginIdPw {
  late String result;
  late String access_token;


  LoginIdPw({
    required this.result,

    required this.access_token,
  });
}
class _loginView extends State<loginView>{
  final myController = TextEditingController();
  String ID = '';
  String PW = '';

  @override
  Widget build(BuildContext context) {
    _postRequest(ID,PW) async {
      String url = 'http://3.130.113.238:5000/login';

      http.Response response = await http.post(
        url,
        headers: <String, String> {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: <String, String> {
          'userid': ID,
          'password': PW
        },
      );
      print(response.body);
    }
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.095,
        title: Text(
          '비켜',
          style: TitleStyle,
        ),

        centerTitle: false,
        backgroundColor: Colors.white,
        shadowColor: null,
        elevation: 0.0,
      ),



      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          TextField(
            onChanged: (A) => ID=A,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ID',
            ),
          ),
          TextField(
            obscureText: true,
            onChanged: (A) => PW=A,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'PW',
            ),
          ),

             FloatingActionButton(

              onPressed: () async{
                // var data = {
                //   "userid" : ID,
                //   "password" : PW,
                // };
                //
                // var body = json.encode(data);
                //
                // http.Response _res = await http.post("http://3.130.113.238:5000/login",
                // headers: {"Content-Type": "application/json"},
                //   body: body
                // );
                // print(_res.statusCode);
                // print(_res.body);
                String apiAddr =
                    'http://3.130.113.238:5000/login';

                var data;

                Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수

                response = await http.post(apiAddr,
                    headers: {
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode({"userid":ID,"password":PW})

                );//필요 api 호출

                data = json.decode(response.body);
                LoginIdPw loginIdPw;
                loginIdPw = LoginIdPw(
                    result: data["result"],
                    access_token: data["access_token"]
                );


                if(loginIdPw.result=="OK"){
                  final res = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage(
                        access_token: loginIdPw.access_token,
                        ID: ID,
                      )));
                }else(print("Fail"));

              },
              child:Icon(Icons.login),
              // onPressed: () async{
              //   final res = await Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => HomePage()));
              // }
            )



        ],
      ),
    );
  }



}