import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Reservation_times {
  late final List<dynamic> machine_reservation_StartTime_hour;
  late final List<dynamic> machine_reservation_StartTime_minute;
  late final List<dynamic> machine_reservation_EndTime_hour;
  late final List<dynamic> machine_reservation_EndTime_minute;


  Reservation_times({
    required this.machine_reservation_StartTime_hour,
    required this.machine_reservation_StartTime_minute,
    required this.machine_reservation_EndTime_hour,
    required this.machine_reservation_EndTime_minute,

  });
}

Future<Reservation_times> getReservation_times() async {
  //api 호출을 위한 주소
  String apiAddr =
      'http://10.0.2.2:5000/echo_call/';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수
  var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.
  Reservation_times reservation_times;


    response = await http.get(apiAddr);//필요 api 호출
    data1 = json.decode(response.body);//받은 정보를 json형태로 decode
    //받은 데이터정보를 필요한 형태로 저장한다.
    reservation_times = Reservation_times(
        machine_reservation_StartTime_hour: data1["_StartTime_hour"],
        machine_reservation_StartTime_minute: data1["_StartTime_minute"],
        machine_reservation_EndTime_hour: data1["_EndTime_hour"],
        machine_reservation_EndTime_minute: data1["_EndTime_minute"],
       );


  return reservation_times;
}