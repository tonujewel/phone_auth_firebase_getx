import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_getx/components/background.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomBackground(
        child:Column(
          children: [
            SizedBox(height: size.height * .45),
            Text('Your number ', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * .02),
            Text('successfully ', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * .02),
            Text('verified', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * .02),
            Text('verified', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
          ],
        )
      ),
    );
  }
}
