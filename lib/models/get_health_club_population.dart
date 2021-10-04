
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Hc_population{
  late int population;


  Hc_population({
    required this.population,

  });
}

Future<Hc_population> getHealthClubPopulation() async{
  String apiAddr =
      'http://3.130.113.238:5000/using';
  Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수
  var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.
  Hc_population hc_population;


  response = await http.get(apiAddr);//필요 api 호출
  data1 = json.decode(response.body);//받은 정보를 json형태로 decode

  //받은 데이터정보를 필요한 형태로 저장한다.
  hc_population = Hc_population(

    population: data1["number"],

  );

  return hc_population;
}