import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_getx/components/background.dart';
import 'package:flutter_firebase_auth_getx/components/loading_button.dart';
import 'package:flutter_firebase_auth_getx/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomBackground(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(height: size.height * .45),
              LoadingButton(
                isLoading: false,
                defaultStyle: true,
                onPressed: () {
                  homeController.addData();
                },
                backgroundColor: Colors.black,
                child: Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    'Add Data',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              LoadingButton(
                isLoading: false,
                defaultStyle: true,
                onPressed: () {
                  homeController.fetchData();
                },
                backgroundColor: Colors.black,
                child: Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    'Fetch Data',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              LoadingButton(
                isLoading: false,
                defaultStyle: true,
                onPressed: () {
                  homeController.deleteData();
                },
                backgroundColor: Colors.red,
                child: Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    'Delete Data',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              LoadingButton(
                isLoading: false,
                defaultStyle: true,
                onPressed: () {
                  homeController.updateData();
                },
                backgroundColor: Colors.green,
                child: Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    'Edit Data',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
