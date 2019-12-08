import 'package:flutter/material.dart';
import 'package:sbb_trains/helpers/app_localizations.dart';
import 'package:sbb_trains/helpers/color_provider.dart';

class DisclaimerPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Disclaimer"),
        backgroundColor: ColorProvider.shared.standardAppBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    AppLocalizations.of(context).translate('disclaimer_title'),
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center
                ),
              ],
            ),
            Row(

              children: <Widget> [
                Container(
                  padding: const EdgeInsets.all(24.0),
                  width: c_width,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                            AppLocalizations.of(context).translate('disclaimer_content'),
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.justify
                        ),
                      )
                      ],
                  ),
                )

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                      AppLocalizations.of(context).translate('disclaimer_button'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        )


      ),
    );
  }
}
