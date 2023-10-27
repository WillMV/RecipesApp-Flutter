import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthExecption implements Exception {
  String message;
  AuthExecption(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? u) {
      user = (u == null) ? null : u;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    user = _auth.currentUser;
    notifyListeners();
  }

  register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthExecption('Week password');
      } else if (e.code == 'email-alread-in-use') {
        throw AuthExecption('Email alread in use');
      }
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthExecption('User not found');
      } else if (e.code == 'wrong-password') {
        throw AuthExecption('Wrong password');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        throw AuthExecption('Invalid credentials');
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
