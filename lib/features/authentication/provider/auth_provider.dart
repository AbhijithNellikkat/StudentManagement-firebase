import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  // ========================================= signUpWithEmailAndPassword =========================================
  
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      notifyListeners(); // Notify listeners on successful sign up
      return userCredential.user;
    } catch (e) {
      log("some error occurred: $e");
    }

    return null;
  }

// ========================================= signInWithEmailAndPassword =========================================

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      notifyListeners();  // Notify listeners on successful sign in
      return userCredential.user;
    } catch (e) {
      log("some error occurred: $e");
    }

    return null;
  }
}
