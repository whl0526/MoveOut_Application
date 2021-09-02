import 'package:flutter/material.dart';
import 'view/HomePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABC App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // if it's a RTL language
      ],
      supportedLocales: [
        const Locale('ko', 'KR'),
        // include country code too
      ],
      theme: ThemeData(
        fontFamily: 'BMHANNAPro',
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
