import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  /*LOGIN usuario */
  static signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
  }

  /*Registrar usuario*/
  static signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
  }

  /* Cerrar sesion */
  static logOut() {
    GoogleSignIn().signOut();

    return _auth.signOut();
  }
}
