import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),

        ),
      ),
    );
  }
}
