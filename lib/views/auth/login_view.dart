import 'dart:ui';

import 'package:boot_camp_final/helper_method/logos.dart';
import 'package:boot_camp_final/helper_method/navigator.dart';
import 'package:boot_camp_final/services/auth_services/auth.dart';
import 'package:boot_camp_final/views/auth/sign_up_view.dart';
import 'package:boot_camp_final/views/auth/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogInView extends StatefulWidget {
  const LogInView({Key key}) : super(key: key);

  @override
  _LogInViewState createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.white,
      ),


      body: 
      Padding(
        
        padding: EdgeInsets.all(10),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgCreator(kInstgramLogo, height: 80, width: 200),
            SizedBox(
              height: 50,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                fillColor: Colors.grey[100],
                filled: true,
                hintText: "email",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueGrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                fillColor: Colors.grey[100],
                filled: true,
                hintText: "password",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueGrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {NavigationMethods.ReplaceTo(context, SignUp());},
              child: Text(
                "Don't have an account?",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                await auth.signIn(email, password);
                NavigationMethods.ReplaceTo(context, Wrapper());
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.pink, Colors.blue, Colors.purple],
                      stops: [0.20, 0.50, 1]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 1),
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("LogIn",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
