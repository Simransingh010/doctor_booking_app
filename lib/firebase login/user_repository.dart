import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking_app/models/user_model_firebase.dart';
import 'package:flutter/material.dart';

class UserRepository {
  static final UserRepository _instance = UserRepository._internal();

  factory UserRepository() {
    return _instance;
  }

  UserRepository._internal();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      await _db.collection('users').add(user.toJson());
      debugPrint('User added to Firestore');
    } catch (e) {
      debugPrint('Error adding user to Firestore: $e');
    }
  }

  Future<UserModel?> getUserDetails(String email) async {
    final snapshot =
        await _db.collection('users').where('Email', isEqualTo: email).get();

    // Check if there's any document with the provided email
    if (snapshot.docs.isEmpty) {
      // Handle the case where no user with the provided email exists
      return null; // Or throw an exception, or return a default user
    }

    // Extract user data from the single document
    final userData = UserModel.fromSnapshot(snapshot.docs.single);
    return userData;
  }

  Future<List<UserModel>> allUserData() async {
    final snapshot = await _db.collection('users').get();

    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}
