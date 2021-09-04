import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Machine_time_list{
  late List<String> end_time_hour;
  late List<String> end_time_min;
  late List<String> start_time_hour;
  late List<String> start_time_min;

  Machine_time_list({
    required this.end_time_hour,
    required this.end_time_min,
    required this.start_time_hour,
    required this.start_time_min,

  });
}

Future<Machine_time_list> getMemberInfo(date) async{
  String apiAddr =
      'http://3.130.113.238:5000/reck_reservation/${date}';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수
  var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.
  Machine_time_list machine_time_list;


  response = await http.get(apiAddr);//필요 api 호출
  data1 = json.decode(response.body);//받은 정보를 json형태로 decode

  //받은 데이터정보를 필요한 형태로 저장한다.
  machine_time_list = Machine_time_list(
    end_time_hour: data1["end_time_hour"],
    end_time_min: data1["end_time_min"],
    start_time_hour: data1["start_time_hour"],
    start_time_min: data1["start_time_min"],
  );
  return machine_time_list;
}