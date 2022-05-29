//basic import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//to get orientation as landscape
import 'package:flutter/services.dart';

//auth service import
import 'package:autobuddy_asd_app/services/auth.dart';

//import for setting up database stream
import 'package:autobuddy_asd_app/services/database.dart';
import 'package:provider/provider.dart';

//import to convert snapshot to custom model
import 'package:autobuddy_asd_app/services/model/custom_database_model.dart';

//custom function to update and read database
import 'package:autobuddy_asd_app/services/query.dart';

//import for routing
import 'package:autobuddy_asd_app/screen/profile.dart';
import 'package:autobuddy_asd_app/screen/progress.dart';
import 'package:autobuddy_asd_app/screen/setting.dart';

//import for decoration
import 'package:autobuddy_asd_app/text.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final AuthService _auth = AuthService();
  LogOut() async {
    await _auth.signOut();
  } //method to logout

  @override
  Widget build(BuildContext context) {
    //these lines of system chrome are to set screen to landscape
    //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return StreamProvider<List<custom_database_model?>?>.value(
      //>?> used so as initialData can be null
      value: DatabaseService()
          .user_data, //note:- while calling stream use variable which is used in creating it
      initialData: null,
      child: Container(
        // scaffold does not have background image property so used container
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/new_bg.png'),
              fit: BoxFit.cover), //fit to resize image and cover full screen
        ),
        child: Scaffold(
          backgroundColor: Colors
              .transparent, //default colour is white which will hide background pic so set it as transparent
          appBar: AppBar(
              elevation: 0.0,
              // backgroundColor: Colors.lightBlue[400],
              backgroundColor: Colors.transparent, //appbar colour is tran
              actions: <Widget>[
                PopupMenuButton<String>(
                  onSelected: choiceAction,
                  itemBuilder: (BuildContext context) {
                    return Constants.choices.map((String choice) {
                      return PopupMenuItem<String>(
                          value: choice,
                          child: Row(
                            children: [
                              Icon(
                                icon_select(choice),
                                color: Colors.black,
                              ),
                              Text(choice),
                            ],
                          ));
                    }).toList();
                  },
                )
              ]),
          body: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select Game',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontFamily: text2,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                print("game clicked"); //==========> enter game routing here
              },
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/game1_thumbnail.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            // Text('dashboard'),
            // RaisedButton(
            //   onPressed: () async {
            //     print(read_data(user_uid));
            //   },
            //   child: Text("record with doc id"),
            // ),
            // RaisedButton(
            //   onPressed: () async {
            //     await update_data(user_uid, 'Name', "hehe");
            //     print(await read_data(user_uid));
            //   },
            //   child: Text("update data with doc id"),
            // ),
            // RaisedButton(
            //   onPressed: () async {
            //     await DatabaseService(uid: user_uid).add_record(1, 2, 3, 4);
            //     await DatabaseService(uid: user_uid).add_record(5, 6, 7, 8);
            //   },
            //   child: Text("add record in game with doc id"),
            // ),
            // RaisedButton(
            //   onPressed: () async {
            //     await read_collection(user_uid);
            //   },
            //   child: Text("read all record in game with doc id"),
            // ),
          ]),
        ),
      ),

      //Remove entire column widget when page ready
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.Settings) {
      Navigator.of(context).pushNamed("/setting");
      print('Settings');
    } else if (choice == Constants.Profile) {
      Navigator.of(context).pushNamed("/profile");
      print('Profile');
    } else if (choice == Constants.Progress) {
      Navigator.of(context).pushNamed("/progress");
      print('Progress');
    } else if (choice == Constants.SignOut) {
      LogOut();
    }
  }

  icon_select(String choice) {
    if (choice == Constants.Settings) {
      return Icons.settings;
    } else if (choice == Constants.Profile) {
      return Icons.person_rounded;
    } else if (choice == Constants.Progress) {
      return Icons.bar_chart_rounded;
    } else if (choice == Constants.SignOut) {
      return Icons.logout;
    }
  }
}

class Constants {
  static const String Profile = 'Profile';
  static const String Progress = 'Progress';
  static const String Settings = 'Settings';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[
    Profile,
    Progress,
    Settings,
    SignOut
  ];
}
