import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tp/model/airport_model.dart';

class DataServices {
  String baseUrl =
      "https://travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com/data/en-GB/airports.json";

  Map<String, String> header = {
    "X-Access-Token": "9fd1af250cb151bd5c13307ebfd93113",
    "X-Rapidapi-Key": "2145d38f3cmsha1e2455334ef9ccp1f609ajsn516592c32c76",
    "X-Rapidapi-Host":
        "travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com",
    "Host": "<calculated when request is sent>",
  };

  Future<List<DataModel>> getAirportInfos() async {
    var apiUrl = '/data/en-GB/airports.json';

    http.Response res = await http.get(Uri.parse(baseUrl), headers: header);

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } 
        return <DataModel>[];
      
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
