import 'dart:async';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                height:MediaQuery.of(context).size.height*0.23,
                decoration: BoxDecoration(
                    image:
                    DecorationImage(
                      image:AssetImage('images/logo.png'),
                    fit:  BoxFit.cover,
                    ),

                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Integraged fitness service',
                    style: TextStyle(
                        fontSize: 15.1,
                      color: Color(0xFFBB9B9B9),
                    ),),
                  ],
                ),

              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Container(
                width: MediaQuery.of(context).size.width*0.77,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    width:1.15,
                  ),
                  borderRadius: BorderRadius.circular(35),
                  color:Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius:10,
                      offset: Offset(5,5),
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    BoxShadow(
                      blurRadius:10,
                      offset: Offset(-5,-5),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      child: Icon(FontAwesomeIcons.user,
                        size:20,
                        color:Color(0xFFBB9B9B9),
                      ),
                    ),
                    Expanded(
                        child:TextField(
                          onChanged: (A) => ID=A,
                          decoration: InputDecoration(
                            border:InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: '이름을 입력하세요.'
                          ),
                        ) )
                  ],
                ),

              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              Container(
                width: MediaQuery.of(context).size.width*0.77,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    width:1.15,
                  ),
                  borderRadius: BorderRadius.circular(35),
                  color:Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius:10,
                      offset: Offset(5,5),
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    BoxShadow(
                      blurRadius:10,
                      offset: Offset(-5,-5),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      child: Icon(
                        Icons.password_rounded,
                        size:20,
                        color: Color(0xFFBB9B9B9),
                      ),
                    ),
                    Expanded(
                        child:TextField(
                          obscureText: true,
                          onChanged: (A) => PW=A,
                          decoration: InputDecoration(
                              border:InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                              hintText: '등록번호를 입력하세요.'
                          ),
                        ) )
                  ],
                ),

              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.015,),


                 InkWell(
                  onTap: () async{
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
                  child:Icon(Icons.login,
                  size:45,
                  color: Color(0xFFBB9B9B9),
                  ),

                  // onPressed: () async{
                  //   final res = await Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => HomePage()));
                  // }
                )



            ],
          ),
        ),
      ),
    );
  }



}