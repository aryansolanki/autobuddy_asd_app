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
    //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return StreamProvider<List<custom_database_model?>?>.value(
      //>?> used so as initialData can be null
      value: DatabaseService()
          .user_data, //note:- while calling stream use variable which is used in creating it
      initialData: null,
      child: Scaffold(
        appBar: AppBar(actions: <Widget>[
          RaisedButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: Text("Logout"),
          ),
        ]),
        body: Column(children: [
          Text('dashboard'),
          RaisedButton(
            onPressed: () async {
              print(read_data(user_uid));
              //print(read_single_data(user_uid, 'Record'));

              // final docRef = FirebaseFirestore.instance
              //     .collection("asd_users_record")
              //     .doc(user_uid);
              // docRef.get().then(
              //   (DocumentSnapshot doc) {
              //     final data = doc.data() as Map<dynamic, dynamic>;
              //     // print(doc.data());
              //     print(data);
              //     // ...
              //   },
              //   onError: (e) => print("Error getting document: $e"),
              // );
            },
            child: Text("record with doc id"),
          ),
          RaisedButton(
            onPressed: () async {
              await update_data(user_uid, 'Name', "hehe");
              print(await read_data(user_uid));
            },
            child: Text("update data with doc id"),
          ),
          RaisedButton(
            onPressed: () async {
              await DatabaseService(uid: user_uid).add_record(1, 2, 3, 4);
              await DatabaseService(uid: user_uid).add_record(5, 6, 7, 8);
            },
            child: Text("add record in game with doc id"),
          ),
          RaisedButton(
            onPressed: () async {
              await read_collection(user_uid);
            },
            child: Text("read all record in game with doc id"),
          ),
        ]),
      ),

      //Remove entire column widget when page ready
    );
  }
}
