
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class Reservation_list{
  late String date;
  late String end_time;
  late String equipment;
  late String start_time;
  late String userid;

  Reservation_list({
    required this.date,
    required this.end_time,
    required this.equipment,
    required this.start_time,
    required this.userid,
  });
}

Future<List<Reservation_list>> getReservationList(memberId) async{
  String apiAddr =
      'http://3.130.113.238:5000/reservation_user/${memberId}';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수

  var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.
  List<Reservation_list> reservation_list = [];


  response = await http.get(apiAddr);//필요 api 호출
  data1 = json.decode(response.body);//받은 정보를 json형태로 decode

  for(int i = 0; i<data1.length;i++) {
    //받은 데이터정보를 필요한 형태로 저장한다.
    reservation_list.add(Reservation_list(
        date: data1[i]["date"],
        end_time: data1[i]["end_time"],
        equipment: data1[i]["equipment"],
        start_time: data1[i]["start_time"],
        userid: data1[i]["userid"]
    ));
  }

  return reservation_list;
}