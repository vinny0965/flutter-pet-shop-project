import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ui/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter_ui/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:flutter_ui/src/features/authentication/screens/welcome/welcome.dart';
import 'package:flutter_ui/src/features/core/screens/dashboard/dashboard.dart';
import 'package:flutter_ui/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variaveis

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => SplashScreen())
        : Get.offAll(() => const DashBoard());
  }

  Future<void> phoneAuthentication(String phoneN) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneN,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        codeSent: ((verificationId, forceResendingToken) {
          this.verificationId.value = verificationId;
        }),
        codeAutoRetrievalTimeout: ((verificationId) {
          this.verificationId.value = verificationId;
        }),
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'Número de telefone informado incorreto');
          }
          if (e.code == 'invalid-verification-code') {
            Get.snackbar('Error', 'Código de Verificação Incorreto');
          }
        });
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => OnBoardingScreen())
          : Get.to(const Welcome());
    } on FirebaseAuthException catch (e) {
      final ex = SiginUpWithEmailAndPasswordFailure.code(e.code);
      // print('FIREBASE AUTH EXEPTION - ${ex.message}');
      // Get.showSnackbar(GetSnackBar(
      //   title: e.message,
      // ));
      Get.snackbar('Error', ex.message);
      throw ex;
    } catch (_) {
      const ex = SiginUpWithEmailAndPasswordFailure();
      // print('EXCEPTION - ${ex.message}');
      // Get.showSnackbar(GetSnackBar(
      //   title: ex.message,
      // ));
      Get.snackbar('Error', ex.message);
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.to(const DashBoard());
    } on FirebaseAuthException catch (e) {
      final ex = SiginUpWithEmailAndPasswordFailure.code(e.code);
      // print('FIREBASE AUTH EXEPTION - ${ex.message}');
      // Get.showSnackbar(GetSnackBar(
      //   title: ex.message,
      // ));
      Get.snackbar('Error', ex.message);
      throw ex;
    } catch (_) {
      const ex = SiginUpWithEmailAndPasswordFailure();
      // print('EXCEPTION - ${ex.message}');
      // Get.showSnackbar(GetSnackBar(
      //   title: ex.message,
      // ));
      Get.snackbar('Error', ex.message);
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
