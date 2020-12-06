import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_getx/utils/AppConstant.dart';
import 'package:flutter_firebase_auth_getx/views/home/home_screen.dart';
import 'package:flutter_firebase_auth_getx/views/note_list/note_list.dart';
import 'package:flutter_firebase_auth_getx/views/otp_screen/otp_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  AuthCredential phoneAuthCredential;
  FirebaseAuth auth = FirebaseAuth.instance;

  var isLoading = false.obs;
  var isOtpLoading = false.obs;

  String countryCode;
  String _verificationId;
  int otpCode;

  // Country code picker dialog
  void countryPickerDialog(BuildContext context) {
    showCountryPicker(
      context: context,
      exclude: <String>['KN', 'MF'],
      showPhoneCode: true,
      onSelect: (Country country) {
        countryCode = country.phoneCode;
      },
    );
  }

  Future<void> submitPhoneNumber() async {
    if (phoneNumberController.text.isEmpty) {
      errorSnackbar(msg: 'Enter phone number');
    } else {
      String code = countryCode == null ? "880" : countryCode;
      String phone;

      if (phoneNumberController.text.trim().startsWith("0")) {
        phone = phoneNumberController.text.trim().substring(1);
      } else {
        phone = phoneNumberController.text.trim();
      }

      isLoading(true);
      String phoneNumber = "+$code$phone";

      void verificationCompleted(AuthCredential phoneAuthCredential) async {
        successSnackbar(msg: 'Verification Completed');
        update();
        this.phoneAuthCredential = phoneAuthCredential;
        await auth.signInWithCredential(phoneAuthCredential);
        print("printing uid in auto complete >>>> ${auth.currentUser.uid}");
        UID = auth.currentUser.uid;
        Get.to(NoteList());
      }

      void verificationFailed(FirebaseAuthException error) {
        isLoading(false);
        update();
        errorSnackbar(msg: "Something Went Wrong");
        handleError(error);
      }

      void codeSent(String verificationId, [int code]) {
        isLoading(false);
        update();
        this._verificationId = verificationId;
        print(verificationId);
        this.otpCode = code;

        print("print otp code $code");
        Get.to(OtpScreen());
      }

      void codeAutoRetrievalTimeout(String verificationId) {
        isLoading(false);
        update();

        print(verificationId);
      }

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(milliseconds: 10000),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      ); // All the callbacks are above
    }
  }

  void submitOTP() async {
    isOtpLoading(true);
    update();
    PhoneAuthCredential phoneAuthCredential =
        PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: otpController.text);
    await auth.signInWithCredential(phoneAuthCredential).then((UserCredential value) {
      if (value.user != null) {
        isOtpLoading(false);
        update();
        print("Phone number " + value.user.phoneNumber);
        print(" uid  >>>> ${auth.currentUser.uid}");
        UID = auth.currentUser.uid;
        Get.offAll(NoteList());

      } else {
        isOtpLoading(false);
        update();
        errorSnackbar(msg: "Something went wrong");
      }
    }).catchError(
      (error) {
        isOtpLoading(false);
        update();
        errorSnackbar(msg: 'Invalid OTP');
      },
    );
  }

  void handleError(e) {
    isLoading(false);
    isOtpLoading(false);
    update();
    errorSnackbar(msg: e.message.toString());
    print(e.message);
  }
}
