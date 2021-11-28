import 'package:boot_camp_final/services/auth_services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container fitCircleImage(String imageURL, {double width = 75, double height = 75,double borderWidth=2.3}) {
 return Container(
    clipBehavior: Clip.hardEdge,
    height: height,
    width: width,
    alignment: Alignment.topCenter,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xffF7A34B),
        Color(0xffDE0046),
      ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      border: Border.all(width: borderWidth, color: Colors.transparent),
      borderRadius: BorderRadius.circular(120),
    ),
    child: Center(
      child: Container(
        margin: EdgeInsets.all(2.3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120),
            border: Border.all(width: 2.3, color: Colors.white),
            image: DecorationImage(
                image: NetworkImage(imageURL),
                fit: BoxFit.fill,
                scale: 1)),
      ),
    ),
  );
}
