import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'exceptions/email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance =>
      Get.put(AuthenticationRepository());

  //Var
  final _auth = FirebaseAuth.instance;
  Rx<User?>? firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser?.bindStream(_auth.userChanges());
  }

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

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken == null && googleAuth?.idToken == null) {
        throw const EmailAndPasswordFailure(
            "Bạn phải chọn tài khoản để tiếp tục");
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final ex = EmailAndPasswordFailure.fromCode(e.code);
      throw ex.message;
    } on EmailAndPasswordFailure catch (e) {
      throw e.message;
    } catch (err) {
      throw err.toString();
    }
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
