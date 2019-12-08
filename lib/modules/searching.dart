import 'package:flutter/material.dart';
import 'package:sbb_trains/helpers/app_localizations.dart';
import 'package:sbb_trains/helpers/color_provider.dart';
import 'package:sbb_trains/networking/api_client.dart';
import 'package:sbb_trains/networking/server_response.dart';
import 'package:sbb_trains/model/station.dart';

class SearchingPage extends StatefulWidget {

  @override
  SearchingPageState createState() => SearchingPageState();

}

class SearchingPageState extends State<SearchingPage> {

  int resultsCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         title: Text(AppLocalizations.of(context).translate('searching_module_name')),
         backgroundColor: ColorProvider.shared.standardAppBackgroundColor,
    ),
      body: Column (
          children: <Widget>[
          TextField(
            onChanged: (word) async {
              Future<ServerResponse<List<Station>>> response = APIClient.shared.fetchLocationList(word);
              ServerResponse<List<Station>> serverResponse = await response;
              if (await serverResponse.responseObject != null) {
              List<Station> listStation = serverResponse.responseObject;
              resultsCount = listStation.length;
              } else {
                print('some expection thrown');
              };
            },
          ),
            SizedBox(height: 20),
            Text('$resultsCount'),
        ]

      ),
      );
  }
}