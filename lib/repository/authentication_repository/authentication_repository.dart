import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'exceptions/email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance =>
      Get.put(AuthenticationRepository());

  //Var
  final _auth = FirebaseAuth.instance;

  late Rx<User?> firebaseUser;

  Future<bool> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      final ex = EmailAndPasswordFailure.fromCode(e.code);
      Get.closeAllSnackbars();
      Get.snackbar(
        'Lỗi',
        ex.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTION: -${ex.message}');
        rethrow;
      }
    } catch (_) {
      const ex = EmailAndPasswordFailure();
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTION: -${ex.message}');
      }
      throw ex;
    }
    return false;
  }

  Future<bool> isDuplicateEmail() async {
    return false;
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      final ex = EmailAndPasswordFailure.fromCode(e.code);
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTION: -${ex.message}');
        print(e.code);
      }
      Get.closeAllSnackbars();
      Get.snackbar(
        'Lỗi',
        ex.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    } catch (_) {
      const ex = EmailAndPasswordFailure();
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTION: -${ex.message}');
      }
      throw ex;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
