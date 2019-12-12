import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:sbb_trains/model/connection.dart';
import 'package:sbb_trains/networking/server_response.dart';
import 'package:http/http.dart' as http;
import 'package:sbb_trains/model/station.dart';
import 'package:sbb_trains/model/connection.dart';


class APIClient {

  final String kLocationsKeyword = 'stations';

  static final APIClient shared = APIClient._internal();
  factory APIClient() {
    return shared;
  }
  APIClient._internal();
  
  Future<ServerResponse<List<Station>>> fetchLocationList(String input) async {
    final response = await http.get('http://transport.opendata.ch/v1/locations?query='+input);
    if(response.statusCode != 200) {
      return ServerResponse(null, 'Cannot load data');
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

  Future<ServerResponse<List<Connection>>> fetchConnections(Station startPoint, Station endPoint, DateTime time) async {

    DateFormat dateFormatter  =  DateFormat('yyyy-MM-dd');
    DateFormat timeFormatter  =  DateFormat('hh:mm');

    String stringDate = dateFormatter.format(time);
    String stringTime = timeFormatter.format(time);

    String startPointId = startPoint.identfier;
    String endPointId = endPoint.identfier;

    String stringUrl = 'http://transport.opendata.ch/v1/connections?from='+startPointId+'&to='+endPointId+'&date='+stringDate+'&time='+stringTime;
    print(stringUrl);

    final response = await http.get(stringUrl);
    if(response.statusCode != 200) {
      return ServerResponse(null, 'Cannot load data');
    } else {
      var list = new List<Connection>();
      Map<String, dynamic> decodedData = await jsonDecode(response.body);
      await print( decodedData);
  }

}