import 'dart:io';

import 'package:boot_camp_final/helper_method/navigator.dart';
import 'package:boot_camp_final/services/auth_services/auth.dart';
import 'package:boot_camp_final/services/firebase_storage/firebase_storage.dart';
import 'package:boot_camp_final/services/firebase_storage/post.dart';
import 'package:boot_camp_final/views/homeviews/main_viewr.dart';
import 'package:boot_camp_final/views/homeviews/post_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class PostUpload extends StatefulWidget {
  const PostUpload({Key key}) : super(key: key);

  @override
  _PostUploadState createState() => _PostUploadState();
}

class _PostUploadState extends State<PostUpload> {
  File image;
  String comment;


  @override
  void initState() {
   
    pickImage();
    super.initState();
  }

  pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    image = File(pickedImage?.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool firstClick = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upload your post",
          textAlign: TextAlign.end,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: image != null
          ? SafeArea(
              minimum: EdgeInsets.fromLTRB(5, 30, 5, 0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38, blurRadius: 5, spreadRadius: 5)
                    ],
                    gradient: LinearGradient(
                        colors: [Colors.purple[500], Colors.purple[900]],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: ListView(children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(image),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {
                          comment = value;
                        },
                        style: GoogleFonts.mulish(
                            color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.mulish(
                              color: Colors.blue, fontSize: 18),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.amber, width: 2),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          hintText: "Post Comment",
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (firstClick) {
                            firstClick = false;
                            Post newPost = Post(
                              username: auth.getUser().displayName,
                              userId: auth.getUser().uid,
                              comment: comment,
                              likes: 0,
                              id: Uuid().v1(),
                              profileimage: auth.getUser().photoURL,
                            );
                            await FirebaseServices.addPost(newPost, image);
                            NavigationMethods.ReplaceTo(context, MainViewer());
                          }
                        },
                        child: Container(
                            height: 40,
                            width: 220,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff686DE0),
                                    Color(0xff4834D4)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text("Upload Post",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mulish(
                                      color: Colors.white70,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            )),
                      ),
                    ],
                  ),
                ]),
              ),
            )
          : SizedBox(),
    );
  }
}
