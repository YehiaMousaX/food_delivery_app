import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //get instance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get current user
  User? getcurrentUser() => _auth.currentUser;

  //sign in
  Future<UserCredential> signInWithEmailPassoword(
      String email, String password) async {
    try {
      //sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //signup
    Future<UserCredential> signUpWithEmailPassoword(
      String email, String password) async {
    try {
      //sign in with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //signout

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
