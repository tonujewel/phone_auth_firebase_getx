import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_getx/utils/AppConstant.dart';
import 'package:flutter_firebase_auth_getx/views/add_note/add_note.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NoteController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  var data;
  int editeIndex;
  @override
  void onInit() {
    print("called onInIt");
    print("boool $isForUpdate");
    print(" check UID $UID");
    getData();

    if(isForUpdate==true){
      setEditData();
    }

    super.onInit();
  }


  void setEditData(){
    data = Get.arguments;
    print("data ${data[0]}  ${data[1]} ${data[2]} index${data[3]} ");

    titleController.text = "${data[0]}";
    descController.text = "${data[1]}";
    editeIndex = data[3];
  }
  @override
  void onClose() {
    titleController.clear();
    descController.clear();
    super.onClose();
  }

  void deleteData(int index) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("notes-$UID");
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[index].reference.delete();
    Get.back();
  }

  void goToAddNote() {
    Get.to(AddNote());
  }

  void addData(Color color) {
    print("color picked $color");

    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate);

    String newColor;

    if (color == Color(0xFFBDBDBD)) {
      newColor = "MaterialColor(primary value: Color(0xFF9E9E9E))";
    } else if (color.toString().startsWith('C')) {
      newColor = "MaterialColor(primary value: Color(0xff000000))";
    } else {
      newColor = color.toString();
    }

    Map<String, dynamic> demoData = {
      "title": titleController.text == null ? "" : "${titleController.text}",
      "desc": descController.text == null ? "" : "${descController.text}",
      "time": "$formattedDate",
      "color": "$newColor",
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("notes-$UID");
    collectionReference.add(demoData);
    titleController.clear();
    descController.clear();
    Get.back();
  }

  Future getData() async {
    var fireStore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await fireStore.collection("notes-$UID").get();
    return querySnapshot.docs;
  }

  void updateData(Color color) async {

    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate);

    String newColor;

    if (color == Color(0xFFBDBDBD)) {
      newColor = "MaterialColor(primary value: Color(0xFF9E9E9E))";
    } else if (color.toString().startsWith('C')) {
      newColor = "MaterialColor(primary value: Color(0xff000000))";
    } else {
      newColor = color.toString();
    }
    Map<String, dynamic> demoData = {
      "title": titleController.text == null ? "" : "${titleController.text}",
      "desc": descController.text == null ? "" : "${descController.text}",
      "time": "$formattedDate",
      "color": "$newColor",
    };

    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("notes-$UID");
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[editeIndex].reference.update(demoData);

    titleController.clear();
    descController.clear();
    Get.back();
  }
}
