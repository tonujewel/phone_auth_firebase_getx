
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBackground extends StatelessWidget {
  Widget child;
  double whiteContainerHeight;
  double blackContainerHeight;

  CustomBackground({this.child, this.whiteContainerHeight});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (whiteContainerHeight != null) {
      blackContainerHeight = 1 - whiteContainerHeight;
    }
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Align(
              child: Column(
                children: [
                  Container(
                    height: whiteContainerHeight == null ? size.height * .3 : size.height * blackContainerHeight,
                    width: size.width,
                    child: Center(
                      child: Image.asset(
                        "assets/images/phone.png",
                        height: 80,
                      ),
                    ),
                  ),
                  Container(
                    height: whiteContainerHeight == null ? size.height * .7 : size.height * whiteContainerHeight,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned.fill(child: child)
        ],
      ),
    );
  }
}

