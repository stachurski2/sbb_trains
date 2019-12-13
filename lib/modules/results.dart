import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbb_trains/model/connection.dart';
import 'package:sbb_trains/helpers/color_provider.dart';
import 'package:sbb_trains/helpers/app_localizations.dart';

class ResultsPage extends StatelessWidget {

  final List<Connection> data;
  ResultsPage(this.data);

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < data.length; i++) {
      print( data[i].startStation.name);
      print(data[i].startTime);
      print(data[i].endStation.name);
      print(data[i].endTime);
      print(data[i].changes);
      print(data[i].duration);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate('results_module_name')),
          backgroundColor: ColorProvider.shared.standardAppBackgroundColor,
    ),
    body: Center(),
    );
  }
}

