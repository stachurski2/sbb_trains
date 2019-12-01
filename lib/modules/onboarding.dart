import 'package:flutter/material.dart';
import 'package:sbb_trains/helpers/app_localizations.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/train-switzerland-logo.png', width: 300, height: 300,),
            SizedBox(
              width: 1,
              height: 25,
            ),
            Text(
                AppLocalizations.of(context).translate('onboarding_welcome_message'),
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center
            ),

            SizedBox(
              width: 1,
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  color: Color.fromRGBO(227, 51, 62, 1.0),
                  textColor: Colors.white,
                  child: Text(
                    AppLocalizations.of(context).translate('onboarding_disclaimer_button_title'),
                  ),
                ),
                SizedBox(width: 50, height: 1),
                RaisedButton(
                  onPressed: () {},
                  color: Color.fromRGBO(227, 51, 62, 1.0),
                  textColor: Colors.white,
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