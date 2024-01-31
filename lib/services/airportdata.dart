import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tp/model/airport_model.dart';
import 'package:tp/model/flight_model.dart';

class DataServices {
  String api_key = "65bbfffe568f9dd3ac5f9d58";
  String baseUrl =
      "https://travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com";

  Map<String, String> header = {
    "X-Access-Token": "9fd1af250cb151bd5c13307ebfd93113",
    "X-Rapidapi-Key": "2145d38f3cmsha1e2455334ef9ccp1f609ajsn516592c32c76",
    "X-Rapidapi-Host":
        "travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com",
    "Content-Type": "application/json",
  };

  Future<List<DataModel>> getAirportInfos() async {
    var apiUrl = '/data/en-GB/cities.json';

    http.Response res =
        await http.get(Uri.parse(baseUrl + apiUrl), headers: header);
    try {
      if (res.statusCode == 200) {
        // print(res.statusCode);

        List<dynamic> list = json.decode(res.body);
        //print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
      //print(res.statusCode);
    } catch (e) {
      //print(res.body);
      //print(res.statusCode);
      print(e);
      return <DataModel>[];
    }
  }

  Future<List<FlightModel>> getFlightList(destination, origin, currency, departureDate) async {
    var apiUrl =
        "/v2/prices/latest?destination=$destination&origin=$origin&period_type=year&one_way=%20&show_to_affiliates=true&trip_class=0&beginning_of_period=$departureDate&currency=$currency&page=1&sorting=price&limit=30";

    http.Response res =
        await http.get(Uri.parse(baseUrl + apiUrl), headers: header);
    try {
      if (res.statusCode == 200) {
        print(res.statusCode);

        List<dynamic> list = json.decode(res.body);
        //print(list);
        return list.map((e) => FlightModel.fromJson(e)).toList();
      } else {
        return <FlightModel>[];
      }
      print(res.statusCode);
    } catch (e) {
      print(res.body);
      print(res.statusCode);
      print(e);
      return <FlightModel>[];
    }
  }
}
