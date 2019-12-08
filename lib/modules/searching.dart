import 'package:flutter/material.dart';
import 'package:sbb_trains/helpers/app_localizations.dart';
import 'package:sbb_trains/helpers/color_provider.dart';
import 'package:sbb_trains/helpers/api_client.dart';

class SearchingPage extends StatefulWidget {

  @override
  SearchingPageState createState() => SearchingPageState();

}

class SearchingPageState extends State<SearchingPage> {
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
              APIClient.shared.fetchLocation(word);
            },
          ),
        ],
          mainAxisAlignment: MainAxisAlignment.center
      )
    );
  }
}