import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_auth_getx/utils/AppConstant.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Map value;
  String name;



  void addData() {
    Map<String, dynamic> demoData = {
      "name": "Jewel Rana",
      "designation": "Mobile app developer",
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("notes-$UID");
    collectionReference.add(demoData);
  }

  void fetchData() {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("notes-$UID");
    collectionReference.snapshots().listen((snapshot) {
      value = snapshot.docs[0].data();
      name = "${snapshot.docs[0].data()}";
      update();
      print("feaching value : $value");
    });
  }

  Future getData() async{

    var fireStore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await fireStore.collection("notes-$UID").get();

    return querySnapshot.docs;

  }

  void deleteData() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("notes-$UID");
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference.delete();
  }

  void updateData() async {
    Map<String, dynamic> demoData = {
      "name": "SoftX ",
      "designation": "Software company",
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("notes-$UID");
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference.update(demoData);
  }
}
