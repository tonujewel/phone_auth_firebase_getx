import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_firebase_getx/views/phone_number.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Firebase Phone Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhoneNumber(),
   //   home: MyHomePage(title: 'Phone Authentication'),
    );
  }
}
