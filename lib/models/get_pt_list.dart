
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class Pt_list{
  late String id;
  late List history;


  Pt_list({
    required this.id,
    required this.history,

  });
}

Future<List<Pt_list>> getPtList(memberId) async{
  String apiAddr =
      'http://3.130.113.238:5000/pt/${memberId}';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수

  var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.
  List<Pt_list> pt_list = [];


  response = await http.get(apiAddr);//필요 api 호출
  data1 = json.decode(response.body);//받은 정보를 json형태로 decode

  for(int i = 0; i<data1.length;i++) {
    //받은 데이터정보를 필요한 형태로 저장한다.
    pt_list.add(Pt_list(
      id: data1[i]["date"],
      history: data1[i]["end_time"],
    ));
  }

  return pt_list;
}