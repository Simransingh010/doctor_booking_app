import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel2 {
  final String? id;
  final String FullName;
  final String Email;
  final String Phone;
  final String Password;
  UserModel2({
    required this.id,
    required this.FullName,
    required this.Email,
    required this.Phone,
    required this.Password,
    // this.profileImageUrl,
    // this.bio,
    // this.link,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': FullName,
      'Email': Email,
      'phoneNo': Phone,
      'password': Password
    };
  }

  factory UserModel2.fromMap(Map<String, dynamic> map) {
    return UserModel2(
      id: map['id'] as String,
      FullName: map['name'] as String,
      Email: map['email'] as String,
      Phone: map['phoneNo'] as String,
      Password: map['password'] as String,
    );
  }
  factory UserModel2.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserModel2(
      id: document.id,
      Email: data!["Email"],
      Phone: data!["Phone"],
      Password: data!["Password"],
      FullName: data!["FullName"],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel2.fromJson(String source) =>
      UserModel2.fromMap(json.decode(source) as Map<String, dynamic>);
}
