
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Member_info{
  late String allcount;
  late String end_date;
  late String enrollment;
  late String gym;
  late int key;
  late String ptdate;
  late String ptinfo;
  late String remaining;
  late String start_date;
  late String user_name;
  late String userid;

  Member_info({
    required this.allcount,
    required this.end_date,
    required this.enrollment,
    required this.gym,
    required this.key,
    required this.ptdate,
    required this.ptinfo,
    required this.remaining,
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
    allcount: data1["allcount"],
    end_date: data1["end_date"],
    enrollment: data1["enrollment"],
    gym: data1["gym"],
    key: data1["key"],
    ptdate: data1["ptdate"],
    ptinfo: data1["ptinfo"],
    remaining: data1["remaining"],
    start_date: data1["start_date"],
    user_name: data1["user_name"],
    userid: data1["userid"],
  );
  return memberInfo;
}