import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_firebase_auth_getx/components/background.dart';
import 'package:flutter_firebase_auth_getx/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomBackground(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Firebase Phone Authentication', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            SizedBox(height: size.height * .02),
            Text('with ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: size.height * .02),
            Text('Getx', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
          ],
        ),
      ),
    );
  }
}
