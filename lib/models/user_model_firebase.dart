import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  UserModel({
    required this.id,
    required this.email,
    required this.phoneNo,
    required this.password,
    required this.fullName,
  });

  toJson() {
    return {
      'FullName': fullName,
      'Email': email,
      'Phone': phoneNo,
      'Password': password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        email: data['Email'],
        phoneNo: data['Phone'],
        password: data['Password'],
        fullName: data['FullName']);
  }
}
