import 'package:flutter/material.dart';
import 'package:move_application/exam.dart';
import 'package:move_application/view/login_view.dart';
import 'view/HomePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BK APP',
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
        fontFamily: 'Pretendard-Medium',
        primarySwatch: Colors.blue,
      ),
      home: loginView(),
    );
  }
}
