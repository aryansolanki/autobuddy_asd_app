import 'package:autobuddy_asd_app/screen/loading.dart';
import 'package:flutter/material.dart';
import 'package:autobuddy_asd_app/screen/option.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loading(),
    );
  }
}
