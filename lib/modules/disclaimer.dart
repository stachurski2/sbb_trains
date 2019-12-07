import 'package:flutter/material.dart';
import 'package:sbb_trains/helpers/app_localizations.dart';
import 'package:sbb_trains/helpers/color_provider.dart';

class Disclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Disclaimer"),
        backgroundColor: ColorProvider.shared.standardAppBackgroundColor,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Text(
                    AppLocalizations.of(context).translate('disclaimer_title'),
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center
                ),
              ],
            ),
            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Padding(
//                  child:  Text(
//                      AppLocalizations.of(context).translate('disclaimer_content'),
//                      style: TextStyle(fontSize: 12),
//                      textAlign: TextAlign.center
//                  ),
//                )
//
//              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go back!'),
                ),
              ],
            ),
          ],
        )


      ),
    );
  }
}