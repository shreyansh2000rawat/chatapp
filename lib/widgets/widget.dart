import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blue,
    title: Image.asset(
      "assets/images/logo.png",
      height: 50,
    ),
  );
}

InputDecoration textFieldInputDecoration(String hintText){
 return InputDecoration(
   hintText: hintText,
   hintStyle: TextStyle(
     color: Colors.white54,
   ),
   focusedBorder: UnderlineInputBorder(
       borderSide: BorderSide(color: Colors.white)),
   enabledBorder: UnderlineInputBorder(
       borderSide: BorderSide(color: Colors.white)),
 );
}

TextStyle simpleTextStyle(){
  return TextStyle(
    color: Colors.white,
    fontSize: 16.0,
  );
}

TextStyle mediumTextStyle(){
 return TextStyle(
    color: Colors.white,
    fontSize: 17.0,
  );
}