import 'package:flutter/material.dart';
import 'package:sbb_trains/helpers/app_localizations.dart';
import 'package:sbb_trains/modules/disclaimer.dart';
import 'package:sbb_trains/modules/searching.dart';
import 'package:sbb_trains/helpers/color_provider.dart';

class OnboardingPage extends StatelessWidget {

  final double kStandardSizeBoxHeight = 25;
  final double kCentralBoxHeight = 50;
  final double kImageWidth = 300;
  final double kImageHeight = 300;
  final double kFontSize = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorProvider.shared.onBoardingBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/train-switzerland-logo.png', width: kImageWidth, height: kImageHeight),
            SizedBox(
              height: kStandardSizeBoxHeight,
            ),
            Text(
                AppLocalizations.of(context).translate('onboarding_welcome_message'),
                style: TextStyle(fontSize: kFontSize),
                textAlign: TextAlign.center
            ),

            SizedBox(
              height: kStandardSizeBoxHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DisclaimerPage()),
                    );
                  },
                  color: ColorProvider.shared.standardAppBackgroundColor,
                  textColor: ColorProvider.shared.standardButttonTextColor,
                  child: Text(
                    AppLocalizations.of(context).translate('onboarding_disclaimer_button_title'),
                  ),
                ),
                SizedBox(width: kCentralBoxHeight),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchingPage()),
                    );
                  },
                  color: ColorProvider.shared.standardAppBackgroundColor,
                  textColor: ColorProvider.shared.standardButttonTextColor,
                  child: Text(
                    AppLocalizations.of(context).translate('onboarding_proceed_button_title'),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );

  }
}

