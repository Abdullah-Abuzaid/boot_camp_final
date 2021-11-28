import 'package:boot_camp_final/helper_method/fit_images.dart';
import 'package:boot_camp_final/helper_method/logos.dart';
import 'package:boot_camp_final/helper_method/navigator.dart';
import 'package:boot_camp_final/services/auth_services/auth.dart';
import 'package:boot_camp_final/services/component/post_viewer.dart';
import 'package:boot_camp_final/services/firebase_storage/firebase_storage.dart';
import 'package:boot_camp_final/services/firebase_storage/post.dart';
import 'package:boot_camp_final/services/post_upload.dart';
import 'package:boot_camp_final/views/auth/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostView extends StatefulWidget {
  PostView({Key key}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
 
  Future<List> getFollowing() async {
    return (await auth.getUserFollowing());
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 15,
          toolbarHeight: 38,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.white),
          backgroundColor: Colors.white,
          title: SvgCreator(kInstgramLogo, height: 30, width: 104),
          actions: [
            GestureDetector(
                onTap: () async {
                  NavigationMethods.PushTo(context, PostUpload());
                },
                child: SvgCreator(kAdd, height: 24)),
            SizedBox(width: 21),
            GestureDetector(
                onTap: () async {
                  await auth.signOut();
                  if (auth.getUser() == null)
                    NavigationMethods.ReplaceTo(context, Wrapper());
                },
                child: SvgCreator(kHeart, height: 24)),
            SizedBox(width: 22),
            GestureDetector(
                onTap: () async {
                  await FirebaseServices.follow("Heelo it me mario");
                },
                child: SvgCreator(kMessengar, height: 24)),
            SizedBox(
              width: 14,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(2, 10, 2, 2),
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                storyImage(auth.getUser().photoURL, auth.getUser().displayName),
                SizedBox(width: 10),
                storyImage(auth.getUser().photoURL, auth.getUser().displayName),
                SizedBox(width: 10),
                storyImage(auth.getUser().photoURL, auth.getUser().displayName),
                SizedBox(width: 10),
                storyImage(auth.getUser().photoURL, auth.getUser().displayName),
                SizedBox(width: 10),
                storyImage(auth.getUser().photoURL, auth.getUser().displayName),
                SizedBox(width: 10),
                storyImage(auth.getUser().photoURL, auth.getUser().displayName),
                SizedBox(width: 10),
                storyImage(auth.getUser().photoURL, auth.getUser().displayName),
                SizedBox(width: 10),
                storyImage(auth.getUser().photoURL, auth.getUser().displayName),
              ]),
            ),
            Divider(
              thickness: 2,
            ),
            FutureBuilder(
                future: Future.wait([FirebaseServices.getPosts(),getFollowing()]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                            children: List<Widget>.generate(
                                snapshot.data[0].length, (index) {
                          if (snapshot.data[1]
                              .contains(snapshot.data[0][index].userId))
                            return PostViewer(snapshot.data[0][index]);
                          else
                            return SizedBox.shrink();
                        })),
                      ),
                    );
                  else {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.red,
                    ));
                  }
                }),
          ]),
        ));
  }
}

Column storyImage(String imageURL, String name) {
  return Column(
    children: [fitCircleImage(imageURL), Text(name)],
  );
}
