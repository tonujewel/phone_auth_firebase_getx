import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_firebase_auth_getx/utils/AppConstant.dart';
import 'package:flutter_firebase_auth_getx/views/add_note/add_note.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class NoteController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  Color c = const Color.fromRGBO(66, 165, 245, 1.0);

  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  var hCode = 0.obs;

  @override
  void onInit() {
    print("called onInIt");
    print(" check UID $UID");
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.clear();
    descController.clear();
    super.onClose();
  }

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    pickerColor = color;

    print("check color  ${color.hashCode}");
    update();
  }

  void colorPicker(BuildContext context){
    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          // child: ColorPicker(
          //   pickerColor: pickerColor,
          //   onColorChanged: changeColor,
          //   showLabel: true,
          //   pickerAreaHeightPercent: 0.8,
          // ),
          // Use Material color picker:
          //
          // child: MaterialPicker(
          //   pickerColor: pickerColor,
          //   onColorChanged: changeColor,
          //   showLabel: true, // only on portrait mode
          // ),
          //
          // Use Block color picker:
          //
          child: BlockPicker(
            pickerColor: currentColor,
            onColorChanged: changeColor,
          ),
        ),
      ),
    );
  }

  void goToAddNote() {
    Get.to(AddNote());
  }

  void addData() {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate);

    Map<String, dynamic> demoData = {
      "title": titleController.text == null ? "" : "${titleController.text}",
      "desc": descController.text == null ? "" : "${descController.text}",
      "time": "$formattedDate",
      "color": "0xFFD7AEFC",
    };

    CollectionReference collectionReference = FirebaseFirestore.instance.collection("notes-$UID");
    collectionReference.add(demoData);
    titleController.clear();
    descController.clear();
    Get.back();
  }

  Future getData() async {
    var fireStore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await fireStore.collection("notes-$UID").get();
    return querySnapshot.docs;
  }
}
