



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CoreTextStyle {
  TextStyle textBold(
      {double fontSz = 10, Color tColor = Colors.black}) {
    return TextStyle(fontSize: fontSz, fontWeight: FontWeight.bold, color: tColor);
  }
  TextStyle textNormal({double fontSz=10, Color tColor = Colors.black}){
    return TextStyle(fontSize:fontSz, color: tColor);
  }
}