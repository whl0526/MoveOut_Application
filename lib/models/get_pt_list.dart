
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

class Pt_history{
  late int Pkey;
  late String PtDay;
  late String StartTime;
  late String ClassContent;
  late String TrainerName;

  Pt_history({
    required this.Pkey,
    required this.PtDay,
    required this.StartTime,
    required this.ClassContent,
    required this.TrainerName,

  });
}

Future<List<Pt_history>> getPtList(memberId) async{
  String apiAddr =
      'http://3.130.113.238:5000/pt/${memberId}';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수

  var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.



  response = await http.get(apiAddr);//필요 api 호출
  data1 = json.decode(response.body);//받은 정보를 json형태로 decode

  print(data1["history"].elementAt(3));
  print('d');
  List<Pt_history> pt_history = [];
  for(int i=0;i<data1["history"].length;i++){
    pt_history.add(
       Pt_history(
           Pkey: data1["history"].elementAt(i)["기본키"],
           PtDay:  data1["history"].elementAt(i)["시간"],
           StartTime:  data1["history"].elementAt(i)["수업 내용"],
           ClassContent:  data1["history"].elementAt(i)["시작 시간"],
           TrainerName:  data1["history"].elementAt(i)["트레이너"])
    );

  }
  return pt_history;
}