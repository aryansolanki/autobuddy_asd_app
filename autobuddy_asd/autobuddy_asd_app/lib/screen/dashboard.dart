import 'package:flutter/material.dart';

//to get orientation as landscape
import 'package:flutter/services.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
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
            onPressed: () {},
            child: Text("Dashboard"),
          ),
        ],
      ),

      //Remove entire column widget when page ready
    );
  }
}
