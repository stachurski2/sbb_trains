import 'dart:convert';

import 'package:http/http.dart' as http;

class APIClient {

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

}