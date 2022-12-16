import 'package:e_skate/sharded/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  AuthService() {}

  Future logIn(BuildContext context, String login, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: login, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
      final snackbar =
          SnackBar(content: Text(e.message!), backgroundColor: globalColor);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  Future resetPassword(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email);
      final snackbar = SnackBar(
          content: const Text('Password reset Email sent'),
          backgroundColor: globalColor);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } on FirebaseAuthException catch (e) {
      print(e);
      final snackbar =
          SnackBar(content: Text(e.message!), backgroundColor: globalColor);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}