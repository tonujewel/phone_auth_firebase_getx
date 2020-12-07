

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_auth_getx/utils/AppConstant.dart';
import 'package:flutter_firebase_auth_getx/views/add_note/add_note.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NoteController extends GetxController{

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

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


  void goToAddNote(){
    Get.to(AddNote());
  }

  void addData() {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate);

    Map<String, dynamic> demoData = {
      "title": titleController.text==null?"":"${titleController.text}",
      "desc": descController.text==null?"":"${descController.text}",
      "time":"$formattedDate",
      "color":"0xFFD7AEFC",
    };

    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("notes-$UID");
    collectionReference.add(demoData);
    titleController.clear();
    descController.clear();
    Get.back();
  }


  Future getData() async{
    var fireStore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await fireStore.collection("notes-$UID").get();
    return querySnapshot.docs;
  }


}