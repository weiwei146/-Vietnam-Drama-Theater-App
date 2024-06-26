import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<bool> isEmailExisted(String email) async {
    final snapshot = await _db
        .collection('users')
        .where(
          'email',
          isEqualTo: email,
        )
        .get()
        .catchError(
      // ignore: body_might_complete_normally_catch_error
      (error) {
        if (kDebugMode) {
          print(error);
        }
      },
    );
    final userData = snapshot.docs.map((e) => UserModel.fromSnapShot(e));
    return userData.isNotEmpty;
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db
        .collection('users')
        .where(
          'email',
          isEqualTo: email,
        )
        .get()
        .catchError(
      // ignore: body_might_complete_normally_catch_error
      (error) {
        if (kDebugMode) {
          print(error);
        }
      },
    );

    final userData = snapshot.docs.map((e) => UserModel.fromSnapShot(e)).single;
    return userData;
  }

  Future<void> updatePassword(UserModel userModel) async {
    await FirebaseAuth.instance.currentUser!
        .updatePassword(userModel.password!);
  }

  Future<void> updateUserDetail(UserModel userModel) async {
    await _db
        .collection('users')
        .doc(userModel.id)
        .update(userModel.toJson())
        .whenComplete(() => Get.snackbar(
              "Thành công",
              "Tài khoản của bạn đã được cập nhật",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green,
              duration: const Duration(seconds: 1),
            ))
        .catchError((error, stacktrace) {
      () => Get.snackbar(
            'Lỗi',
            'Có gì đó không đúng, thử lại?',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
          );
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  createUser(UserModel userModel) async {
    await _db
        .collection('users')
        .add(userModel.toJson())
        .whenComplete(
          () => Get.snackbar(
            'Thành công',
            'Tài khoản của bạn đã được tạo',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        // ignore: body_might_complete_normally_catch_error
        .catchError((error, stacktrace) {
      () => Get.snackbar(
            'Lỗi',
            'Có gì đó không đúng, thử lại?',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
          );
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
