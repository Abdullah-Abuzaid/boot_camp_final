import 'package:boot_camp_final/helper_method/fit_images.dart';
import 'package:boot_camp_final/models/users.dart';
import 'package:boot_camp_final/services/firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserViewer extends StatelessWidget {
  AppUser appUser;
  UserViewer(AppUser appUser, {Key key}) : super(key: key) {
    this.appUser = appUser;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              fitCircleImage(appUser.profilePhoto, width: 60, height: 60),
              SizedBox(
                width: 10,
              ),
              Text(appUser.username),
              Spacer(),
              GestureDetector(
                onTap: () {
                  
                  FirebaseServices.follow(this.appUser.id);
                },
                child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff686DE0), Color(0xff4834D4)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text("Follow",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    )),
              ),
            ],
          ),
          Text(appUser.pio),
        ],
      ),
    );
  }
}
