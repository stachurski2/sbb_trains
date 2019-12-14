import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbb_trains/model/connection.dart';
import 'package:sbb_trains/helpers/color_provider.dart';
import 'package:sbb_trains/helpers/app_localizations.dart';
import 'package:intl/intl.dart';

class ResultsPage extends StatelessWidget {

  final List<Connection> data;
  ResultsPage(this.data);
  DateFormat timeFormatter =  DateFormat('HH:mm');
  DateFormat dateFormatter =  DateFormat('yyyy-MM-dd');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate('results_module_name')),
          backgroundColor: ColorProvider.shared.standardAppBackgroundColor,
    ),
    body: ListView.separated(
       separatorBuilder:  ( BuildContext context, int index) => SizedBox(height: 10),
        padding: const EdgeInsets.all(10),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: ColorProvider.shared.standardSilverColor), right: BorderSide(color: ColorProvider.shared.standardSilverColor)),
                  color: ColorProvider.shared.resultCellBackgroundColor,
              ),
            child:
                Column(
                  children: <Widget>[
                    Container(
                      height: 1,
                      color: ColorProvider.shared.standardSilverColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(data[index].startStation.name),
                              Text(timeFormatter.format((data[index].startTime))),
                              Text(dateFormatter.format((data[index].startTime))),

                            ],

                          ),
                          SizedBox(width: 20),
                          Text(AppLocalizations.of(context).translate('results_module_arrow')),
                          SizedBox(width: 20),
                          Column(
                            children: <Widget>[
                              Text(data[index].endStation.name),
                              Text(timeFormatter.format((data[index].endTime))),
                              Text(dateFormatter.format((data[index].endTime))),

                            ],
                          ),
                        ]),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 1,
                      color: ColorProvider.shared.standardSilverColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).translate('results_module_duration') + data[index].duration),
                        Text(AppLocalizations.of(context).translate('results_module_changes') + (data[index].changes.toString())),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 1,
                      color: ColorProvider.shared.standardSilverColor,
                    ),
                  ],
                )
                );
            }
         )
    );
  }
}

