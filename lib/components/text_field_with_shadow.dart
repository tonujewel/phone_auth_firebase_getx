import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWithShadow extends StatelessWidget {
  String hintText;
  String label;
  TextEditingController controller;
  Color mFillColor;
  double radius;
  double height;
  TextInputType keyboardType;
  bool isEditable;

  TextFieldWithShadow(
      {Key key,
      @required this.controller,
      this.hintText,
      this.label,
      this.mFillColor,
      this.radius,
      this.height,
      this.keyboardType,
      this.isEditable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height == null ? null : height,
      padding: EdgeInsets.only(right: 2, left: 2),
      child: Material(
        elevation: 2,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(radius == null ? 10 : radius)
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: TextFormField(
            enabled: isEditable==null?true:isEditable,
            controller: controller,
            keyboardType:
                keyboardType == null ? TextInputType.text : keyboardType,
            decoration: InputDecoration(
                hintText: hintText,
                labelText: label,
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                hintStyle: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
                fillColor: mFillColor == null ? Colors.white30 : mFillColor,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none)),
          ),
        ),
      ),
    );
  }
}
