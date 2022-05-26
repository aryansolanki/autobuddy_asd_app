import 'package:cloud_firestore/cloud_firestore.dart';

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
    dynamic record,
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
      'Record': record,
    });
  }
}
