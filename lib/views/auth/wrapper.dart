import 'package:boot_camp_final/services/auth_services/auth.dart';
import 'package:boot_camp_final/views/auth/login_view.dart';
import 'package:boot_camp_final/views/homeviews/home_view.dart';
import 'package:boot_camp_final/views/homeviews/main_viewr.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key key}) : super(key: key);

  bool isSignIn = auth.getUser() != null;

  @override
  Widget build(BuildContext context) {
    
    if (isSignIn) {
      print(isSignIn);
      return MainViewer();
    } else
      return LogInView();
  }
}
