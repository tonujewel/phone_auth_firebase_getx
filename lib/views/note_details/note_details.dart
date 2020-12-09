import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_getx/views/style/style.dart';
import 'package:get/get.dart';

class NoteDetails extends StatefulWidget {


  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {

  var data;
  @override
  void initState() {
     data = Get.arguments;
    print("data ${data[0]}  ${data[1]} ${data[2]}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse("${data[2]}")),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Note Details"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 20, left: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Text("${data[0]}",style: kNoteTitleLight,),
            const SizedBox(height: 14),
          Text("${data[1]}",style: kNoteTextLargeLight,),
          ],
        ),
      ),
    );
  }
}
