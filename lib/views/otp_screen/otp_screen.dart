import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_getx/components/background.dart';
import 'package:flutter_firebase_auth_getx/components/loading_button.dart';
import 'package:flutter_firebase_auth_getx/controllers/auth_controller.dart';
import 'package:flutter_firebase_auth_getx/utils/AppConstant.dart';
import 'package:flutter_firebase_auth_getx/views/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpScreen extends StatelessWidget {

  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * .4),

              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Verify Otp', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PinPut(
                      validator: (s) {
                        if (s.contains('1')) return null;
                        return 'Not valid!';
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      withCursor: true,
                      fieldsCount: 6,
                      fieldsAlignment: MainAxisAlignment.spaceAround,
                      textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
                      eachFieldMargin: EdgeInsets.all(0),
                      eachFieldWidth: 45.0,
                      eachFieldHeight: 55.0,
                      // focusNode: _pinPutFocusNode,
                      controller: authController.otpController,
                      submittedFieldDecoration: pinPutDecoration,
                      selectedFieldDecoration: pinPutDecoration.copyWith(
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(160, 215, 220, 1),
                        ),
                      ),
                      followingFieldDecoration: pinPutDecoration,
                      pinAnimationType: PinAnimationType.scale,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Obx((){
                      return LoadingButton(
                        isLoading: authController.isOtpLoading(),
                        defaultStyle: true,
                        onPressed: () {
                          authController.submitOTP();
                         // Get.to(HomeScreen());
                        },
                        backgroundColor: Colors.black,
                        child: Container(
                          height: 30,
                          alignment: Alignment.center,
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    })

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(235, 236, 237, 1),
    borderRadius: BorderRadius.circular(5.0),
  );
}
