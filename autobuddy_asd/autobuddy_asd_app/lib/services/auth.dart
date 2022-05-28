//import of plugin we require
import 'package:autobuddy_asd_app/services/model/custom_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import of databaseservice.dart that we created
import 'package:autobuddy_asd_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  custom_user _userFromFirebaseUser(User? user) {
    //return user != null ? custom_user(uid: user.displayName) : null;
    if (user != null) {
      return custom_user(uid: user.uid);
    } else {
      return custom_user(
          uid:
              null); // Note instead of just null I had to convert it to custom user type with value as null
    }
  }

  // auth change user stream
  Stream<custom_user> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
    //.map((User user) => _userFromFirebaseUser(user));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      //return user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(dynamic email, dynamic password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(dynamic email, dynamic password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user?.uid).updateUserData(
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
      );
      // we have kept starting value as null

      print(user?.uid);
      user_uid = user?.uid;

      // final docRef = FirebaseFirestore.instance
      //     .collection("asd_users_record")
      //     .doc(user?.uid);
      // docRef.get().then(
      //   (DocumentSnapshot doc) {
      //     //final data = doc.data() as Map<dynamic, dynamic>;
      //     print(doc.data());
      //     // ...
      //   },
      //   onError: (e) => print("Error getting document: $e"),
      // );

      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

//variable to store user uid
dynamic user_uid;
