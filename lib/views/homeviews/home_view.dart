import 'dart:io';

import 'package:boot_camp_final/helper_method/navigator.dart';
import 'package:boot_camp_final/services/auth_services/auth.dart';
import 'package:boot_camp_final/services/post_upload.dart';
import 'package:boot_camp_final/views/auth/wrapper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  File image;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.light),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            auth.getUser().photoURL,
            width: 200,
          ),
          Text(auth.getUser().displayName),
          GestureDetector(
            onTap: () async {
              // Pick an image
              await auth.signOut();
              if(auth.getUser() == null)
                NavigationMethods.PushTo(context, Wrapper());

            },
            child: Container(
              height: 120,
              width: 110,
              decoration: BoxDecoration(
                  color: Colors.amber, border: Border.all(width: 5)),
            ),
          ),
          GestureDetector(
            onTap: () async {
              NavigationMethods.PushTo(context, PostUpload());
            },
            child: Container(
              height: 120,
              width: 110,
              decoration: BoxDecoration(
                  color: Colors.amber, border: Border.all(width: 5)),
            ),
          )
        ],
      ),
    );
  }
}
