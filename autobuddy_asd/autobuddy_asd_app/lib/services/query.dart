//import to convert snapshot to custom model
import 'package:autobuddy_asd_app/services/model/custom_database_model.dart';

//basic import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//import of databaseservice.dart that we created
import 'package:autobuddy_asd_app/services/database.dart';
import 'package:autobuddy_asd_app/services/auth.dart';

//XXXXXXXXXXXXXXXXXXXX For 1st Collection 'asd_users_record'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//function to read all data in a document
Future read_data(dynamic user_uid) async {
  final docRef =
      FirebaseFirestore.instance.collection("asd_users_record").doc(user_uid);
  docRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<dynamic, dynamic>;
      print(data);
      // ...
    },
    onError: (e) => print("Error getting document: $e"),
  );
}

//function to read field data in a document
Future read_single_data(dynamic user_uid, String field) async {
  final docRef =
      FirebaseFirestore.instance.collection("asd_users_record").doc(user_uid);
  docRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<dynamic, dynamic>;
      print(data[field]);
      // ...
    },
    onError: (e) => print("Error getting document: $e"),
  );
}

//function to update document
Future update_data(
    dynamic user_uid, String field, dynamic value_of_field) async {
  //choose one of the following in field :- 1)Name 2)Gender 3)Date of birth 4)Month of birth 5)Year of birth 6)Contact number 7)E-mail ID 8)Password
  // try and not choose following feild9)Game ID 10)Level 11)Time taken 12)Number of wrong answer
  final docRef =
      FirebaseFirestore.instance.collection("asd_users_record").doc(user_uid);
  docRef.update({field: value_of_field}).then(
      (value) => print("DocumentSnapshot successfully updated!"),
      onError: (e) => print("Error updating document $e"));
}

//XXXXXXXXXXXXXXXXXXXX For sub Collection XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

//to add record use add_record function
//example syntax:- await DatabaseService(uid: user?.uid).add_record(1, 2, 3, 4);
//where 1st variable entered is game id
//where 1st variable entered is level
//where 1st variable entered is Time taken
//where 1st variable entered is number4 of wrong answers

//function to read all data in a subcollection
Future read_collection(dynamic user_uid) async {
  CollectionReference _collectionRef = FirebaseFirestore.instance
      .collection("asd_users_record")
      .doc(user_uid)
      .collection("records");
  QuerySnapshot querySnapshot = await _collectionRef.get();
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  print(
      allData); //NOTE:- this allData is List so can use list indexing and has dictionary as elements
}
