import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:sbb_trains/modules/onboarding.dart';
import 'package:sbb_trains/helpers/app_localizations.dart';

class SbbTrains extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SBB Trains',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        supportedLocales: [
          Locale('en', 'US'),
        ],
        localizationsDelegates: [

          AppLocalizations.delegate

        ],
        // Returns a locale which will be used by the app
        localeResolutionCallback: (locale, supportedLocales) {

           return  Locale('en', 'US');
        },
      home: OnboardingPage(),
    );
  }
}
