import 'dart:convert';
import 'package:sbb_trains/networking/server_response.dart';
import 'package:http/http.dart' as http;
import 'package:sbb_trains/model/station.dart';
class APIClient {

  final String kLocationsKeyword = 'stations';

  static final APIClient shared = APIClient._internal();
  factory APIClient() {
    return shared;
  }
  APIClient._internal();

  Future<http.Response> fetchLocation(String input) async {
    final response = await http.get('http://transport.opendata.ch/v1/locations?query='+input);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    }
    return response;
  }


  Future<ServerResponse<List<Station>>> fetchLocationList(String input) async {
    final response = await http.get('http://transport.opendata.ch/v1/locations?query='+input);
    if(response.statusCode != 200) {
      return ServerResponse(null, Exception('Cannot load data'));
    } else {
      var list = new List<Station>();
      Map<String, dynamic> decodedData = await jsonDecode(response.body);
      List stationsList = await decodedData[kLocationsKeyword];
      for (var i = 0; i < stationsList.length; i++) {
        Map<String, dynamic> stationData = await stationsList[i];

        if(stationData['id'] != null && stationData['name'] != null) {
          Station station = Station(stationData['id'], stationData['name']);
          list.add(station);
        }
      }
    return ServerResponse(list,null);
    }

  }

}