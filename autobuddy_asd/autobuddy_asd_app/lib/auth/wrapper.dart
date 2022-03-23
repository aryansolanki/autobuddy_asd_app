import 'package:flutter/material.dart';
import 'package:autobuddy_asd_app/screen/option2.dart';

class wrapper extends StatefulWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  State<wrapper> createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('wrapper page'),
          RaisedButton(
            onPressed: () {},
            child: Text("Dashboard"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/option2");
            },
            child: Text("sign in/sign up page"),
          )
        ],
      ),
      //this page will not be visible when ready just it will work in background
      //Remove entire column widget when page ready
      //Place where check if logged in or out if in go to dashboard if not go to sign in signup page
    );
  }
}
