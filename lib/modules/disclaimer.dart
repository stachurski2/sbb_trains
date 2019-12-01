import 'package:flutter/material.dart';
import 'package:sbb_trains/helpers/app_localizations.dart';

class Disclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Disclaimer"),
        backgroundColor: Color.fromRGBO(227, 51, 62, 1.0),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}