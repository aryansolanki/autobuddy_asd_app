import 'package:autobuddy_asd_app/screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:autobuddy_asd_app/screen/option2.dart';
//Import for Provider
import 'package:provider/provider.dart';
//import of custom model
import 'package:autobuddy_asd_app/services/model/custom_user.dart';

class wrapper extends StatefulWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  State<wrapper> createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<custom_user>(context);
    print(user.uid.runtimeType);
    // return either the option screen or dashboard
    if (user.uid == null) {
      return option2();
    } else {
      return dashboard();
    }
    // return Container(
    //   child: Column(
    //     children: [
    //       Text('wrapper page'),
    //       RaisedButton(
    //         onPressed: () {
    //           Navigator.of(context).pushNamed("/dashboard");
    //         },
    //         child: Text("if logged in ==>Dashboard"),
    //       ),
    //       RaisedButton(
    //         onPressed: () {
    //           Navigator.of(context).pushNamed("/option2");
    //         },
    //         child: Text("if not logged in==>login/sign up"),
    //       ),
    //     ],
    //   ),
    //   //this page will not be visible when ready just it will work in background
    //   //Remove entire column widget when page ready
    //   //Place where check if logged in or out if in go to dashboard if not go to sign in signup page
    // );
  }
}
