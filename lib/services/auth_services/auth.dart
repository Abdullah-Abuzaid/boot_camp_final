import 'dart:ffi';

import 'package:boot_camp_final/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class auth {
  static CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  static regis(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static signIn(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static getUser() {
    return FirebaseAuth.instance.currentUser;
  }

  static signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> saveUserInfo() async {
    User user = FirebaseAuth.instance.currentUser;
    AppUser newUser = AppUser(
      id: user.uid,
      followers: [],
      following: [],
      pio: "New User",
      profilePhoto: user.photoURL,
      username: user.displayName,
    );
    await users.doc(user.uid).set(newUser.toMap());
  }

  static Future<List> getUserFollowing() async {
    return (await(await users.doc(auth.getUser().uid)).get()).get("following");
  }
}
