import 'package:boot_camp_final/main.dart';
import 'package:boot_camp_final/models/users.dart';
import 'package:boot_camp_final/services/auth_services/auth.dart';
import 'package:boot_camp_final/services/component/user_viewer.dart';
import 'package:boot_camp_final/services/firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key key}) : super(key: key);

  @override
  _UsersViewState createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Follow people",
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: FirebaseServices.getUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                
                return Column(
                  children: List.generate(snapshot.data.length, (index) {
                    if (snapshot.data[index].id != auth.getUser().uid)
                      return UserViewer(snapshot.data[index]);
                    else
                      return SizedBox.shrink();
                  }),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
