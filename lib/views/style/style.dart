



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


/// [TextStyle] for note title in a preview card
const kNoteTitleLight = TextStyle(
  color: kNoteTitleColorLight,
  fontSize: 21,
  height: 19 / 16,
  fontWeight: FontWeights.medium,
);

/// [TextStyle] for text notes
const kNoteTextLight = TextStyle(
  color: kNoteTextColorLight,
  fontSize: 16,
  height: 1.3125,
);


/// [TextStyle] for text notes in detail view
const kNoteTextLargeLight = TextStyle(
  color: kNoteDetailTextColorLight,
  fontSize: 18,
  height: 1.3125,
);