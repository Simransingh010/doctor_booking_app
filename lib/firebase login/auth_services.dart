import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  User? get currentUser => _user;

  AuthService() {
    _user = _auth.currentUser;
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      if (user == null) {
        log('Navigate to HomeScreen');
      } else {
        log('Navigate to SignupScreen');
      }
    });
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log('SOMETHING WENT WRONG!');
      return null;
    }
  }

  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log('SOMETHING WENT WRONG!');
      return null;
    }
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log('SOMETHING WENT WRONG!');
    }
  }
}
