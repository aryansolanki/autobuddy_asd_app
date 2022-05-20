//basic import
import 'package:flutter/material.dart';

//to get orientation as landscape
import 'package:flutter/services.dart';

//auth service import
import 'package:autobuddy_asd_app/services/auth.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    //these lines of system chrome are to set screen to landscape
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return Container(
      child: Column(
        children: [
          Text('dashboard'),
          RaisedButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: Text("Logout"),
          ),
        ],
      ),

      //Remove entire column widget when page ready
    );
  }
}
