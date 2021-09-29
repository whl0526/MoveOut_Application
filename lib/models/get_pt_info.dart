
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class Pt_Info{
  late String ExserciseContent;
  late String Set;
  late String Count;



  Pt_Info({
    required this.ExserciseContent,
    required this.Set,
    required this.Count,

  });
}



Future<List<Pt_Info>> getPtInfo(PtPKey) async{
  String apiAddr =
      'http://3.130.113.238:5000/ptinfo/${PtPKey}';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수

  var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.



  response = await http.get(apiAddr);//필요 api 호출
  data1 = json.decode(response.body);//받은 정보를 json형태로 decode

  List<Pt_Info>  pt_info= [];
  for(int i=0;i<data1.length;i++){
    pt_info.add(
      Pt_Info(
          ExserciseContent: data1.elementAt(i)["운동"],
          Set: data1.elementAt(i)["세트"],
          Count: data1.elementAt(i)["횟수"])
    );
  }
  print(pt_info.length);

  return pt_info;
}