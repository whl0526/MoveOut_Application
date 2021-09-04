
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


Future postMachineReservation(userId,date,startTime,endTime) async{
  String apiAddr =
      'http://3.130.113.238:5000/reck_reservation/${date}';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수
  response = await http.post(apiAddr,body:
  {'userid':userId,'date':date,'start_time':startTime,'end_time':endTime});//필요 api 호출
  print(response.statusCode);
}