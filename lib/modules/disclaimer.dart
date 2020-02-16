import 'package:flutter/material.dart';
import 'package:sbb_trains/helpers/app_localizations.dart';
import 'package:sbb_trains/helpers/color_provider.dart';

class DisclaimerPage extends StatelessWidget {

  final double kHeaderFontSize = 25;
  final double kFontSize = 12;
  final kPadding = EdgeInsets.all(24.0);

  @override
  Widget build(BuildContext context) {
    double constantWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('disclaimer_module_name')),
        backgroundColor: ColorProvider.shared.standardAppBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    AppLocalizations.of(context).translate('disclaimer_title'),
                    style: TextStyle(fontSize: kHeaderFontSize),
                    textAlign: TextAlign.center
                ),
              ],
            ),
            Row(

              children: <Widget> [
                Container(
                  padding: kPadding,
                  width: constantWidth,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                            AppLocalizations.of(context).translate('disclaimer_content'),
                            style: TextStyle(fontSize: kFontSize),
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
          ],
        )


      ),
    );
  }
}
