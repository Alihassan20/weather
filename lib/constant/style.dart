
import 'package:flutter/material.dart';

TextStyle kbstyle (BuildContext context, double fraction,  Color color) {

  return TextStyle(fontWeight: FontWeight.bold,fontSize:fraction,color: color, );
}

TextStyle kstyle (BuildContext context, double fraction,  Color color) {

  return TextStyle(fontSize:fraction,color: color, );
}

TextStyle kfstyle (BuildContext context, double fraction,  Color color, String font) {

  return TextStyle(fontSize:fraction,color: color,fontFamily: font );
}