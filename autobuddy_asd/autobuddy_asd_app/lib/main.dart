import 'package:autobuddy_asd_app/screen/loading.dart';
import 'package:flutter/material.dart';
import 'package:autobuddy_asd_app/screen/option.dart';
import 'package:flutter/services.dart'; //to colour status bar
import 'package:autobuddy_asd_app/colour.dart';

void main() {
//code for status bar colour
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: status_bar_colour,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: option(),
        routes: {
          '/': (context) => loading(),
          '/option': (context) => option(),
        });
  }
}
