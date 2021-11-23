import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

Future<Response> deleteReservationList(memberId,machineName,reservationDate) async{
  String apiAddr =
      'http://3.130.113.238:5000/delete/${memberId}?name=${machineName}&date=${reservationDate}';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수
  response = await http.delete(apiAddr);


  return response;
}