

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_auth_getx/utils/AppConstant.dart';
import 'package:get/get.dart';

class NoteController extends GetxController{


  @override
  void onInit() {
    print("called onInIt");
    print(" check UID $UID");
    getData();
    super.onInit();
  }

  Future getData() async{
    var fireStore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await fireStore.collection("notes-$UID").get();
    return querySnapshot.docs;
  }


}