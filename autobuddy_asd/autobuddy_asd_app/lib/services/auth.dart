import 'package:autobuddy_asd_app/services/model/custom_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  // register with email and password

  // sign out

}
