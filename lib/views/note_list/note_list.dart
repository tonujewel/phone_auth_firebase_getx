import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_getx/controllers/note_controller.dart';
import 'package:flutter_firebase_auth_getx/utils/AppConstant.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:popup_menu/popup_menu.dart';

class NoteList extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteController.goToAddNote();
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Note list"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("notes-$UID")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return new Text('Loading...');
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StaggeredGridView.countBuilder(
                    physics: BouncingScrollPhysics(),
                    crossAxisCount: 4,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) => Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                       color: Color(int.parse("${snapshot.data.docs[index].data()['color']}".substring(35, 45))),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data.docs[index].data()['title']}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${snapshot.data.docs[index].data()['desc']}",
                              style: TextStyle(color: Colors.black)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${snapshot.data.docs[index].data()['time']}",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          )
                        ],
                      ),
                    ),
                    staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }



}
