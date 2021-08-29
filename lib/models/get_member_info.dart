
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class Member_info{
  late String end_date;
  late String enrollment;
  late String start_date;
  late String user_name;
  late String userid;

  Member_info({
    required this.end_date,
    required this.enrollment,
    required this.start_date,
    required this.user_name,
    required this.userid,
  });
}

Future<Member_info> getMemberInfo(memberId) async{
  String apiAddr =
      'http://3.130.113.238:5000/userdata/${memberId}';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수
  var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.
  Member_info memberInfo;


  response = await http.get(apiAddr);//필요 api 호출
  data1 = json.decode(response.body);//받은 정보를 json형태로 decode

  //받은 데이터정보를 필요한 형태로 저장한다.
  memberInfo = Member_info(
    end_date: data1[0]["end_date"],
    enrollment: data1[0]["enrollment"],
    start_date: data1[0]["start_date"],
    user_name: data1[0]["user_name"],
    userid:data1[0]["userid"]
  );
  return memberInfo;
}