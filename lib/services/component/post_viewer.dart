import 'package:boot_camp_final/helper_method/fit_images.dart';
import 'package:boot_camp_final/helper_method/logos.dart';
import 'package:boot_camp_final/services/auth_services/auth.dart';
import 'package:boot_camp_final/services/firebase_storage/post.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PostViewer extends StatelessWidget {
  Post post;
  // PostViewer(
  //   Post post,{
  //   Key key,
  // }) : super(key: key);
  

  PostViewer(Post post,{Key key}): super(key: key){
    this.post = post;
    
  } 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(8, 60, 8, 0)),
            fitCircleImage(post.profileimage,
                height: 50, width: 50, borderWidth: 0.1),
            SizedBox(
              width: 10,
            ),
            Text(
              post.username,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            SvgCreator(kMore, height: 24),
            SizedBox(
              width: 15,
            )
          ],
        ),
        Container(width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height/2.22,
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(post.imageUrl),
      )
    ),
    )
        ,
        Row(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(12, 25, 10, 10)),
            SvgCreator(kHeart, height: 24),
            SizedBox(
              width: 14,
            ),
            SvgCreator(kChat, height: 24),
            SizedBox(
              width: 14,
            ),
            SvgCreator(kShare, height: 24),
            Spacer(),
            SvgCreator(kBookmark, height: 24),
            SizedBox(
              width: 14,
            )
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Text(
              "${post.likes}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: 35,
              width: 15,
            ),
            
            Text(
              post.username,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
          child: Text(
                post.comment??"",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15),
          
              ),
        )
      ],
    );
  }
}
