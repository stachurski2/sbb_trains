import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbb_trains/helpers/app_localizations.dart';
import 'package:material_search/material_search.dart';
import 'package:sbb_trains/helpers/color_provider.dart';
import 'package:sbb_trains/networking/api_client.dart';
import 'package:sbb_trains/networking/server_response.dart';
import 'package:sbb_trains/model/station.dart';

class SearchingPage extends StatefulWidget {

  @override
  SearchingPageState createState() => SearchingPageState();

}

class SearchingPageState extends State<SearchingPage> {

  Station selectedFrom;
  Station selectedTo;
  List<Station> stationList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         title: Text(AppLocalizations.of(context).translate('searching_module_name')),
         backgroundColor: ColorProvider.shared.standardAppBackgroundColor,
    ),
      body:
        Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Row(
              children: <Widget>[
                Text(AppLocalizations.of(context).translate('searching_start_journey_label'),
                  textAlign: TextAlign.left)]
              ),
          MaterialSearchInput<Station>(
                  placeholder: selectedFrom == null ? AppLocalizations.of(context).translate('searching_start_journey_placeholder') : '',
          getResults: (word) async {
            Future<ServerResponse<List<Station>>> response = APIClient.shared.fetchLocationList(word);
            ServerResponse<List<Station>> serverResponse = await response;
            List<Station> listStation = serverResponse.responseObject;
            if (serverResponse.serverException == null) {
              return listStation.map((station) => MaterialSearchResult<Station>(
               value: station, //The value must be of type <String>
               text: station.name)).toList();
            } else {
              return List<MaterialSearchResult<Station>>();
            }
          },
          onSelect: (station) {
            selectedFrom = station;
          },
          formatter: (station) {
            return station.name;
          },
          ),
              SizedBox(height: 10),
              Row(
                  children: <Widget>[
                    Text(AppLocalizations.of(context).translate('searching_end_journey_label'),
                        textAlign: TextAlign.left)]
              ),

              MaterialSearchInput<Station>(
            placeholder: selectedTo == null ? AppLocalizations.of(context).translate('searching_end_journey_placeholder') : '',
            getResults: (word) async {
              Future<ServerResponse<List<Station>>> response = APIClient.shared.fetchLocationList(word);
              ServerResponse<List<Station>> serverResponse = await response;
              List<Station> listStation = serverResponse.responseObject;
              if (serverResponse.serverException == null) {
                return listStation.map((station) => MaterialSearchResult<Station>(
                    value: station, //The value must be of type <String>
                    text: station.name)).toList();
              } else {
                return List<MaterialSearchResult<Station>>();
              }
            },
            onSelect: (station) {
              selectedTo = station;
            },
            formatter: (station) {
              return station.name;
            })
            ],

          ),
        )





//      Column (
//          children: <Widget>[
//            SizedBox(height: 10),
//            Row(
//              children: <Widget>[
//                Text(AppLocalizations.of(context).translate('searching_start_journey_label'),
//                  textAlign: TextAlign.left)]
//            ),
//            Container(
//                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
//                child: MaterialSearchInput<Station>(
//                  placeholder: selectedFrom == null ? 'Start journey place:' : '',
//                  getResults: (word) async {
//                    Future<ServerResponse<List<Station>>> response = APIClient.shared.fetchLocationList(word);
//                    ServerResponse<List<Station>> serverResponse = await response;
//                    List<Station> listStation = serverResponse.responseObject;
//                    return listStation.map((station) =>  MaterialSearchResult<Station>(
//                        value: station, //The value must be of type <String>
//                        text: station.name)).toList();
//                  },
//                  onSelect: (station) {
//                    selectedFrom = station;
//                  },
//                  formatter: (station) {
//                    return station.name;
//                  },
//            )
//
//            ),
//            SizedBox(height: 10),
//            Text(AppLocalizations.of(context).translate('searching_end_journey_label')),
//            Container(
//                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
//                child: MaterialSearchInput<Station>(
//                  placeholder: selectedFrom == null ? 'End journey place:' : '',
//                  getResults: (word) async {
//                    Future<ServerResponse<List<Station>>> response = APIClient.shared.fetchLocationList(word);
//                    ServerResponse<List<Station>> serverResponse = await response;
//                    List<Station> listStation = serverResponse.responseObject;
//                    return listStation.map((station) =>  MaterialSearchResult<Station>(
//                        value: station, //The value must be of type <String>
//                        text: station.name)).toList();
//                  },
//                  onSelect: (station) {
//                    selectedTo = station;
//                  },
//                  formatter: (station) {
//                    return station.name;
//                  },
//                )
//
//            ),
//        ]
//
//      ),
      );
  }
}