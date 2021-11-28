import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationMethods {
  static PushTo(context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static ReplaceTo(context, page) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static Pop(context) {
    Navigator.pop(context);
  }
}
