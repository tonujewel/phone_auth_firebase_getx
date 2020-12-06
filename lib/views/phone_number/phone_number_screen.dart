import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_getx/components/background.dart';
import 'package:flutter_firebase_auth_getx/components/loading_button.dart';
import 'package:flutter_firebase_auth_getx/components/text_field_with_shadow.dart';
import 'package:flutter_firebase_auth_getx/controllers/auth_controller.dart';
import 'package:get/get.dart';

class PhoneNumber extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomBackground(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                SizedBox(height: size.height * .4),
                Row(
                  children: [
                    SizedBox(width: 15),
                    Text(
                      'Verify your phone ',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(height: size.height * .08),
                Row(
                  children: [
                    Material(
                      elevation: 2,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        child: GestureDetector(
                          onTap: () {
                            authController.countryPickerDialog(context);
                          },
                          child: Row(
                            children: [
                              Text(authController.countryCode == null ? '880' : authController.countryCode),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFieldWithShadow(
                        controller: authController.phoneNumberController,
                        hintText: 'phone number',
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height * .03),

                Obx((){
                  return LoadingButton(
                    isLoading: authController.isLoading(),
                    defaultStyle: true,
                    onPressed: () {
                      authController.submitPhoneNumber();
                    },
                    backgroundColor: Colors.black,
                    child: Container(
                      height: 30,
                      alignment: Alignment.center,
                      child: Text(
                        'Send Code',
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
        ),
      ),
    );
  }
}
