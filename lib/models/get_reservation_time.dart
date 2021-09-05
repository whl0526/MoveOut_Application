import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Reservation_times {
  late String machine_reservation_StartTime_hour;
  late String machine_reservation_StartTime_minute;
  late String machine_reservation_EndTime_hour;
  late String machine_reservation_EndTime_minute;


  Reservation_times({
    required this.machine_reservation_StartTime_hour,
    required this.machine_reservation_StartTime_minute,
    required this.machine_reservation_EndTime_hour,
    required this.machine_reservation_EndTime_minute,

  });
}

Future<List<Reservation_times>> getReservation_times(date) async {
  //api 호출을 위한 주소
  String apiAddr =
      'http://3.130.113.238:5000/reck_reservation/$date';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수
  var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.
  Reservation_times reservation_times;


    response = await http.get(apiAddr);//필요 api 호출
    data1 = json.decode(response.body);//받은 정보를 json형태로 decode
    //받은 데이터정보를 필요한 형태로 저장한다.
  List<Reservation_times> reservation_times_list=[];

  for(int i =0;i<data1["start_time_hour"].length;i++){
    reservation_times_list.add(
        Reservation_times(
          machine_reservation_StartTime_hour: data1["start_time_hour"].elementAt(i),
          machine_reservation_StartTime_minute: data1["start_time_min"].elementAt(i),
          machine_reservation_EndTime_hour: data1["end_time_hour"].elementAt(i),
          machine_reservation_EndTime_minute: data1["end_time_min"].elementAt(i),
        )
    );

    }


  return reservation_times_list;
}