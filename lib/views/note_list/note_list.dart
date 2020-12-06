import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_getx/controllers/note_controller.dart';
import 'package:flutter_firebase_auth_getx/utils/AppConstant.dart';
import 'package:get/get.dart';

class NoteList extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: size.height * .5,
              color: Colors.blue,
              child: FutureBuilder(
                  future: noteController.getData(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text("Loading..."),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (_, index) {
                            return ListTile(
                              title: Text(snapshot.data[index].data()['name']),
                              subtitle:
                                  Text(snapshot.data[index].data()['designation']),
                            );
                          });
                    }
                  }),
            ),
          ),
          // Container(
          //   height: size.height * .5,
          //   color: Colors.red,
          //   child: StreamBuilder(
          //     stream: FirebaseFirestore.instance.collection("notes-$UID").snapshots(),
          //       builder: (context, snapshot) {
          //         if(snapshot.hasData){
          //           return ListView.builder(
          //             itemCount: snapshot.data.docs,
          //               itemBuilder: (context, index){
          //               DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
          //
          //               return ListTile(
          //                 title: ,
          //               )
          //               });
          //         }
          //       }),
          // ),
        ],
      ),
    );
  }
}
