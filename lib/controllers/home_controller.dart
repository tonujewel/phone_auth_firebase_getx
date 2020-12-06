



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  Map value;
  String name;



  void addData(){

    Map<String , dynamic> demoData = {
      "name": "Jewel Rana",
      "designation": "Mobile app developer",
    };

    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    collectionReference.add(demoData);
  }

  void fetchData(){
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    collectionReference.snapshots().listen((snapshot) {

      value = snapshot.docs[0].data();
      name = "${snapshot.docs[0].data()}";
      update();
      print("feaching value : $value");
    });
  }
}