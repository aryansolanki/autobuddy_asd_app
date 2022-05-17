//basic import
import 'package:flutter/material.dart';

//screen and other widget import
import 'package:autobuddy_asd_app/screen/loading.dart';
import 'package:autobuddy_asd_app/screen/option.dart';
import 'package:autobuddy_asd_app/wrapper/wrapper.dart';
import 'package:autobuddy_asd_app/screen/option2.dart';
import 'package:autobuddy_asd_app/screen/sign_in.dart';
import 'package:autobuddy_asd_app/screen/sign_up1.dart';
import 'package:autobuddy_asd_app/screen/dashboard.dart';
import 'package:autobuddy_asd_app/screen/forgot_password.dart';

//other service, color, text file import
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
        debugShowCheckedModeBanner:
            false, // to remove debug strip from right side up corner

        //home: sign_up1(),
        routes: {
          '/': (context) => loading(),
          '/option': (context) => option(),
          '/wrapper': (context) => wrapper(),
          '/option2': (context) => option2(),
          '/sign_in': (context) => sign_in(),
          '/sign_up1': (context) => sign_up1(),
          '/dashboard': (context) => dashboard(),
          '/forgot_password': (context) => forgot_password(),
        });
  }
}
