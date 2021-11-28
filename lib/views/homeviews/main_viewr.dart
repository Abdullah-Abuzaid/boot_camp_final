import 'package:boot_camp_final/helper_method/logos.dart';
import 'package:boot_camp_final/views/homeviews/post_view.dart';
import 'package:boot_camp_final/views/homeviews/users_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainViewer extends StatefulWidget {
  const MainViewer({Key key}) : super(key: key);

  @override
  _MainViewerState createState() => _MainViewerState();
}

class _MainViewerState extends State<MainViewer> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
             currentIndex = value;
          });
         
        },
        selectedItemColor: Colors.amber,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(icon: SvgCreator(kBookmark,height: 25), label: "weew"),
          BottomNavigationBarItem(icon: SvgCreator(kAdd,height: 25), label: "weew")
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          PostView(),
          UsersView(),

          
        ],
      ),
    );
  }
}
