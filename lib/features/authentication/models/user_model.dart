import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String? phoneNumber;
  final String? password;

  UserModel({
    required this.name,
    required this.email,
    this.phoneNumber,
    this.password,
    this.id,
  });

  toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    var data = document.data()!;
    return UserModel(
      id: document.id,
      email: data['email'],
      name: data['name'],
      phoneNumber: data['phoneNumber'],
      password: data['password'],
    );
  }
}
