import 'package:flutter/material.dart';

class ComponentStyles {

  static const TextStyle addToCartTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle noItemTextStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle appBarTitleStyle = TextStyle(
    fontSize: 30, fontWeight: FontWeight.bold
  );

   static const TextStyle scanAndPayTextStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );



  static const BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  );
}
