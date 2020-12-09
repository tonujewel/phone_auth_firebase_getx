import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<BoxShadow> primaryShadow = [
  BoxShadow(
    color: Color(0xFF90CAF9),
    blurRadius: 2.0,
    spreadRadius: 2.0,
  )
];

void errorSnackbar({@required String msg}) {
  return Get.snackbar('$msg', "Error !",
      snackPosition: SnackPosition.TOP, backgroundColor: Colors.red[200], colorText: Colors.white);
}

void successSnackbar({@required String msg}) {
  return Get.snackbar('$msg', "Success !",
      snackPosition: SnackPosition.TOP, backgroundColor: Colors.green[400], colorText: Colors.white);
}


String UID;

bool isForUpdate = false;
