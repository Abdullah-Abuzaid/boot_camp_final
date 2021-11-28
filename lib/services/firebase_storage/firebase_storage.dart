import 'dart:io';

import 'package:boot_camp_final/models/users.dart';
import 'package:boot_camp_final/services/auth_services/auth.dart';
import 'package:boot_camp_final/services/firebase_storage/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseServices {
  static CollectionReference posts =
      FirebaseFirestore.instance.collection("posts");
  static CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  static void addPost(Post post, File image) async {
    post.imageUrl = await (await FirebaseStorage.instance
            .ref("posts/${post.userId}/${post.id}")
            .putFile(image))
        .ref
        .getDownloadURL();

    await posts.doc(post.id).set(post.toMap());
  }

  static Future<List<Post>> getPosts() async {
    List<Post> postsList = [];
    await (posts.get().then((value) => {
          value.docs.forEach((post) {
            postsList.add(Post.fromMap(post.data()));
          })
        }));

    return postsList;
  }

  static Future<List<AppUser>> getUsers() async {
    List<AppUser> appUsers = [];
    await users.get().then((value) => {
          value.docs.forEach((appUser) {
            appUsers.add(AppUser.fromMap(appUser.data()));
          })
        });
    return appUsers;
  }

  static Future<void> follow(String uid) async {
    if (auth.getUser() != null) {
      List following =
          ((await users.doc(auth.getUser().uid).get()).get("following"))
              .toList();

      if (following.contains(uid)) {
        following.remove(uid);
        await users.doc(auth.getUser().uid).update({"following": following});
      } else {
        following.add(uid);
        await users.doc(auth.getUser().uid).update({"following": following});
      }
    }
  }
}
