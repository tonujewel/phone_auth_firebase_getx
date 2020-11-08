import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_firebase_getx/controllers/auth_controller.dart';
import 'package:phone_auth_firebase_getx/utils/loading_button.dart';

class PhoneNumber extends StatelessWidget {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Verify Your Number",
                style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                //  keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[200])),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[300])),
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintText: "Phone Number"),
                controller: authController.phoneNumberController,
              ),
              SizedBox(height: 16),
              Container(
                  width: double.infinity,
                  child: Obx(() {
                    return LoadingButton(
                      isLoading: authController.isLoading(),
                      defaultStyle: true,
                      onPressed: () {
                        authController.submitPhoneNumber();
                      },
                      backgroundColor: Colors.blue,
                      child: Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          child: Text(
                            'Send code',
                            style: TextStyle(
                                color: Colors.white,

                            ),
                          )),
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
