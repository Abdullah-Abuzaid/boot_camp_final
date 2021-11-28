import 'dart:io';
import 'dart:ui';

import 'package:boot_camp_final/helper_method/logos.dart';
import 'package:boot_camp_final/helper_method/navigator.dart';
import 'package:boot_camp_final/services/auth_services/auth.dart';
import 'package:boot_camp_final/views/auth/login_view.dart';
import 'package:boot_camp_final/views/auth/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email;
  String password;
  String username;
  File profileImage;
  String profileUrl;
  FirebaseStorage firebase = FirebaseStorage.instance;

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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          SizedBox(
            height: 120,
          ),
          Text(
            "SignUp",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          Text(
            "To",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          SvgCreator(kInstgramLogo, height: 80, width: 200),
          SizedBox(
            height: 50,
          ),
          TextField(
            onChanged: (value) {
              username = value;
            },
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true,
              hintText: "username",
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
            onTap: () async {
              final ImagePicker _picker = ImagePicker();
              final XFile pickedImage =
                  await _picker.pickImage(source: ImageSource.gallery);
              profileImage = File(pickedImage?.path);
            },
            child: Container(
                height: 40,
                width: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff686DE0), Color(0xff4834D4)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text("Upload Profile image",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mulish(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              NavigationMethods.ReplaceTo(context, LogInView());
            },
            child: Text(
              "Already have an account?",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              if (profileImage != null && email != null && password != null) {
                await auth.regis(email, password);

                profileUrl = await (await firebase
                        .ref("users/profile/${auth.getUser().uid}")
                        .putFile(profileImage))
                    .ref
                    .getDownloadURL();
                if (auth.getUser() != null) {
                  await auth.getUser().updateProfile(
                      displayName: username, photoURL: profileUrl);
                  await auth.saveUserInfo();
                }
                print(auth.getUser().photoURL);
                NavigationMethods.ReplaceTo(context, Wrapper());
              }
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
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text("Sign Up",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
