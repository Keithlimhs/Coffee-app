import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_coffee_app/models/newuser.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FireBaseUser

  NewUser? _userFromFirebaseUser(User? user) {
    return user != null ? NewUser(uid: user.uid) : null;
  }
  
  // auth change user stream
  Stream<NewUser?> get user {
    return _auth.authStateChanges()
      //.map((User? user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }

  // Sign in anon

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password

  // register with email and password

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}