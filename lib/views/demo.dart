import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_getx/components/list_menu.dart';
import 'package:flutter_firebase_auth_getx/utils/simple_account_menu.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Container(
              child: SimpleAccountMenu(
                icons: [
                  Icon(Icons.person),
                  Icon(Icons.settings),
                  Icon(Icons.credit_card),
                ],
                iconColor: Colors.white,
                onChange: (index) {
                  print(index);
                },
              )),
        ),
      ),
    );
  }
}