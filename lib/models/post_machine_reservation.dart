
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


Future<Response> getMemberInfo(userId,date,start_time,end_time) async{
  String apiAddr =
      'http://3.130.113.238:5000/reck_reservation/${date}';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수
  response = await http.post(apiAddr,body: {'userid':userId,'date':date,'start_time':start_time,'end_time':end_time});//필요 api 호출
  return response;
}