import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:sbb_trains/model/connection.dart';
import 'package:sbb_trains/networking/server_response.dart';
import 'package:http/http.dart' as http;
import 'package:sbb_trains/model/station.dart';
import 'package:sbb_trains/model/connection.dart';


class APIClient {

  final String kLocationsKeyword = 'stations';
  final String kConnectionsKeyword = 'connections';

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
        list.add(retrieveStationFrom(stationData));
      }
    return ServerResponse(list,null);
    }
  }

  Future<ServerResponse<List<Connection>>> fetchConnections(Station startPoint, Station endPoint, DateTime time) async {

    DateFormat dateFormatter  =  DateFormat('yyyy-MM-dd');
    DateFormat timeFormatter  =  DateFormat('HH:mm');

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
      List connectionList = await decodedData[kConnectionsKeyword];
      for (var i = 0; i < connectionList.length; i++) {
        Map<String, dynamic> connectionData = await connectionList[i];
        list.add(retrieveConnectionFrom(connectionData));
      }

      return ServerResponse(list, null);
    }


  }

  Station retrieveStationFrom( Map<String, dynamic> dictionary) {
    if(dictionary['id'] != null && dictionary['name'] != null) {
      return Station(dictionary['id'], dictionary['name']);
    } else {
      return null;
    }
  }

  Connection retrieveConnectionFrom(Map<String, dynamic> dictionary) {
    final String kFromKeyword = 'from';
    final String kToKeyword = 'to';
    final String kStationKeyword = 'station';
    final String kDepartureKeyword = 'departure';
    final String kArrivalKeyword = 'arrival';
    final String kDurationKeyword = 'duration';
    final String kProductsKeyword = 'products';

    Map<String, dynamic> stationFromData = dictionary[kFromKeyword];
    Map<String, dynamic> stationToData = dictionary[kToKeyword];
    Station startStation = retrieveStationFrom(stationFromData[kStationKeyword]);
    Station endStation =  retrieveStationFrom(stationToData[kStationKeyword]);
    String departureTime =  stationFromData[kDepartureKeyword];
    String arrivalTime =  stationToData[kArrivalKeyword];
    String duration =  dictionary[kDurationKeyword];
    List products =  dictionary[kProductsKeyword];
    int changes = products.length - 1;
    return Connection(startStation,endStation,departureTime,arrivalTime,duration,changes);
  }

}