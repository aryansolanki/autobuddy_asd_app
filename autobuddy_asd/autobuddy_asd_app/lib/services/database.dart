import 'package:cloud_firestore/cloud_firestore.dart';
//import to convert snapshot to custom model
import 'package:autobuddy_asd_app/services/model/custom_database_model.dart';
//to get current Date and time
import 'package:intl/intl.dart';

class DatabaseService {
  //to get and store uid so as to map it with its document and have document name as uid
  final String? uid; // ? because String cannot have null
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference autobuddys_asd_collection =
      FirebaseFirestore.instance.collection('asd_users_record');

  //function to update user data
  //use this when first creating user and then in setting and any time game is played and record needs to be updated
  Future<void> updateUserData(
    dynamic name,
    dynamic gender,
    dynamic date_of_birth,
    dynamic month_of_birth,
    dynamic year_of_birth,
    dynamic contact_number,
    dynamic email_id,
    dynamic password,
  ) async {
    return await autobuddys_asd_collection.doc(uid).set({
      //.doc used to set name  of document as uid, .set used to enter data
      'Name': name,
      'Gender': gender,
      'Date of birth': date_of_birth,
      'Month of birth': month_of_birth,
      'Year of birth': year_of_birth,
      'Contact number': contact_number,
      'E-mail ID': email_id,
      'Password': password,
    });
  }

  // XXXXXXXXXXXXXXXXXXXXXXXXXXXX sub collectionXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// total number of document in collection is number of times game played
//on arranging date and time in assending order can get progress and all

  Future<void> add_record(
    dynamic game_id,
    dynamic level,
    dynamic time_taken,
    dynamic number_of_wrong_answer,
  ) async {
    await FirebaseFirestore.instance
        .collection('asd_users_record')
        .doc(uid)
        .collection("records")
        .add({
      'Game ID': game_id,
      'Level': level,
      'Time taken': time_taken,
      'Number of wrong answer': number_of_wrong_answer,
      'Time': DateFormat("HH:mm:ss").format(DateTime.now()),
      'Date': DateFormat("yyyy-MM-dd").format(DateTime.now()),
      //add your data that you want to upload
    });
  }

  //XXXXXXXXXXXXXX CURRENTLY NOT USING CUSTOM MODEL ANYWHEREXXXXXXXXXXXXXXXXXXXXXX
  // brew list from snapshot
  List<custom_database_model?> _custom_database_model_from_snapshot(
      QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return custom_database_model(
        name: doc['Name'] ?? null,
        gender: doc['Gender'] ?? null,
        date_of_birth: doc['Date of birth'] ?? null,
        month_of_birth: doc['Month of birth'] ?? null,
        year_of_birth: doc['Year of birth'] ?? null,
        contact_number: doc['Contact number'] ?? null,
        email_id: doc['E-mail ID'] ?? null,
        password: doc['Password'] ?? null,
        record: doc['Record'] ?? null,
      );
    }).toList();
  }

  // setting stream to get updated data
  //this stream is kept on dashboard to see updates with help of provider package
  Stream<List<custom_database_model?>> get user_data {
    //QuerySnapshot here is return type and it is default type which comes from firebase
    return autobuddys_asd_collection
        .snapshots()
        .map(_custom_database_model_from_snapshot);
  }
}
