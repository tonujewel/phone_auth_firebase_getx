import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_firebase_auth_getx/controllers/note_controller.dart';
import 'package:flutter_firebase_auth_getx/utils/AppConstant.dart';
import 'package:flutter_firebase_auth_getx/views/style/style.dart';
import 'package:get/get.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final NoteController noteController = Get.put(NoteController());

  Color pickerColor = Color(0xFFBDBDBD);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
      print("check color  $pickerColor");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:pickerColor,
      floatingActionButton: buildFloatingActionButton(context),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(isForUpdate==false?"Add note":"Update Note"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if(isForUpdate==false){
                  noteController.addData(pickerColor);
                }else{
                  noteController.updateData(pickerColor);
                }

              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 20, left: 20,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: noteController.titleController,
              style: kNoteTitleLight,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
                hintStyle: kNoteTitleLight,
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
              decoration: const InputDecoration.collapsed(
                hintText: 'Note',
                hintStyle: kNoteTextLargeLight,
              ),
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {

        showDialog(
          context: context,
          child: AlertDialog(
            title: const Text('Pick a color!'),
            actions: [
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Get.back();
                },
              )
            ],
            content: SingleChildScrollView(
              child: BlockPicker(
                pickerColor: currentColor,
                onColorChanged: changeColor,
              ),
            ),
          ),
        );
      },
      backgroundColor: Colors.grey,
    );
  }
}
