import 'dart:async';

import 'package:flutter_firebase_auth_getx/views/phone_number/phone_number_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    print("call oniti");
    Timer(Duration(seconds: 3), () => Get.off(PhoneNumber()));
    super.onInit();
  }
}
