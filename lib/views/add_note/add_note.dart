import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_getx/controllers/note_controller.dart';
import 'package:flutter_firebase_auth_getx/views/style/style.dart';
import 'package:get/get.dart';

class AddNote extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:noteController.currentColor,

      floatingActionButton: FloatingActionButton(
        onPressed: (){
         noteController.colorPicker(context);
        },

        backgroundColor: Colors.black,
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Add note"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){
            noteController.addData();
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                noteController.addData();
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: noteController.titleController,
              style: kNoteTitleLight,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
                counter: const SizedBox(),
              ),
              maxLines: null,
              maxLength: 1024,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 14),
            TextField(
              controller: noteController.descController,
              style: kNoteTextLargeLight,
              decoration: const InputDecoration.collapsed(hintText: 'Note'),
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
            ),
          ],
        ),
      ),
    );
  }
}
