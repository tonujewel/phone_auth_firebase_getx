



import 'package:flutter/material.dart';

class FontWeights {
  FontWeights._();

  static const thin = FontWeight.w100;
  static const extraLight = FontWeight.w200;
  static const light = FontWeight.w300;
  static const normal = FontWeight.normal;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.bold;
  static const extraBold = FontWeight.w800;
  static const black = FontWeight.w900;
}


const kNoteTextColorLight = Color(0x99000000);
const kNoteTitleColorLight = Color(0xFF202124);
const kNoteDetailTextColorLight = Color(0xC2000000);

const kColorPickerBorderColor = Color(0x21000000);


/// Available note background colors
const List<Color> colorList = [
  Color(0xFFFFFFFF),
  Color(0xFFF28C82),
  Color(0xFFFABD03),
  Color(0xFFFFF476),
  Color(0xFFCDFF90),
  Color(0xFFA7FEEB),
  Color(0xFFCBF0F8),
  Color(0xFFAFCBFA),
  Color(0xFFD7AEFC),
  Color(0xFFFDCFE9),
  Color(0xFFE6C9A9),
  Color(0xFFE9EAEE),
];


/// [TextStyle] for note title in a preview card
const kNoteTitleLight = TextStyle(
  color: Colors.white70,
  fontSize: 21,
  height: 19 / 16,
  fontWeight: FontWeights.medium,
);

/// [TextStyle] for text notes
const kNoteTextLight = TextStyle(
  color: Colors.white70,
  fontSize: 16,
  height: 1.3125,
);


/// [TextStyle] for text notes in detail view
const kNoteTextLargeLight = TextStyle(
  color: Colors.white70,
  fontSize: 18,
  height: 1.3125,
);