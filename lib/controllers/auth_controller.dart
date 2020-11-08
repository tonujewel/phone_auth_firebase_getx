import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_firebase_getx/views/otp_page.dart';

class AuthController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  AuthCredential phoneAuthCredential;
  String _status;
  String _verificationId;
  int _code;
  var isLoading = false.obs;
  var isOtpLoading = false.obs;

  Future<void> submitPhoneNumber() async {
    isLoading(true);
    String phoneNumber = phoneNumberController.text.toString().trim();
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      _status += 'verificationCompleted\n';
      Get.to(OTP());
      isLoading(false);

      this.phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);

    }

    void verificationFailed(AuthException error) {
      isLoading(false);
      update();
      Get.snackbar('Failed', 'Something went Wrong');
      print('verificationFailed');
      handleError(error);

    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
      this._verificationId = verificationId;
      print(verificationId);
      this._code = code;
      Get.to(OTP());
      print(code.toString());

      _status += 'Code Sent\n';
      isLoading(false);
      update();

    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
      _status += 'codeAutoRetrievalTimeout\n';
      isLoading(false);
      update();
      print(verificationId);

    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      timeout: Duration(milliseconds: 10000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      /// When this function is called there is no need to enter the OTP, you can click on Login button to sigin directly as the device is now verified
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,

    ); // All the callbacks are above

  }

  void submitOTP() {
    String smsCode = otpController.text.toString().trim();

    this.phoneAuthCredential = PhoneAuthProvider.getCredential(
        verificationId: this._verificationId, smsCode: smsCode);
    Get.snackbar('Success', 'Verification successful!');
  }

  void handleError(e) {
    print(e.message);
    _status += e.message + '\n';
    isLoading(false);
    update();
  }
}
