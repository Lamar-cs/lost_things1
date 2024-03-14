import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? email;
  final int? userType;

  UserModel({
    required this.name,
    required this.email,
    required this.userType
  });

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      name: jsonData['name'],
      email: jsonData ['email'],
      userType: jsonData['userType'],

    );
  }

  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'],
      email: data ['email'],
      userType: data['userType'],

    );
  }
}
