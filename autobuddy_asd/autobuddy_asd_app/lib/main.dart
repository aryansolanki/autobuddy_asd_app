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
import 'package:autobuddy_asd_app/services/auth.dart';
import 'package:autobuddy_asd_app/screen/profile.dart';
import 'package:autobuddy_asd_app/screen/progress.dart';
import 'package:autobuddy_asd_app/screen/setting.dart';

//other service, color, text file import
import 'package:flutter/services.dart'; //to colour status bar
import 'package:autobuddy_asd_app/colour.dart';

//import of custom model
import 'package:autobuddy_asd_app/services/model/custom_user.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

//Import for Provider
import 'package:provider/provider.dart';

void main() async {
//code for status bar colour
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: status_bar_colour,
    statusBarIconBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
    options: FirebaseOptions(
      apiKey: "AIzaSyD81arbNhCR23Cb0Qj6AvBowFAEaL-VlK4",
      appId: "1:639736626355:android:e140efee9c959ff6f884c6",
      messagingSenderId: "XXX",
      projectId: "autobuddys-app",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<custom_user>.value(
      value: AuthService().user,
      initialData: custom_user(uid: null),
      child: MaterialApp(
          debugShowCheckedModeBanner:
              false, // to remove debug strip from right side up corner

          //home: AuthService(),
          routes: {
            '/': (context) => loading(),
            '/option': (context) => option(),
            '/wrapper': (context) => wrapper(),
            '/option2': (context) => option2(),
            '/sign_in': (context) => sign_in(),
            '/sign_up1': (context) => sign_up1(),
            '/dashboard': (context) => dashboard(),
            '/forgot_password': (context) => forgot_password(),
            '/profile': (context) => profile(),
            '/progress': (context) => progress(),
            '/setting': (context) => setting(),
          }),
    );
  }
}
