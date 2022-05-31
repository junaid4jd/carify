
import 'package:carify_app/screens/InAppScreens/SellerScreens/SettingsScreens/settingsSeller.dart';
import 'package:carify_app/screens/InAppScreens/SellerScreens/all_likes_screen.dart';
import 'package:carify_app/screens/InAppScreens/chat_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarSeller extends StatefulWidget {
  const NavBarSeller({Key? key}) : super(key: key);

  @override
  State<NavBarSeller> createState() => _NavBarSellerState();
}

class _NavBarSellerState extends State<NavBarSeller> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState(){
    super.initState();
    pageController = PageController();

  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);

  }

  void onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: [
            AllLikes(),
            ChatScreen(),
            SettingsScreenSeller()

          ],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite,
                    color: _page==0? Color(0xFF00ff00): Colors.white
                ),
                label:'',
                backgroundColor: Color(0xFF00ff00)),

            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_rounded,
                    color: _page==1? Color(0xFF00ff00): Colors.white
                ),
                label:'',
                backgroundColor: Color(0xFF00ff00)),

            BottomNavigationBarItem(
                icon: Icon(Icons.person,
                    color: _page==2? Color(0xFF00ff00): Colors.white
                ),
                label:'',
                backgroundColor: Color(0xFF00ff00)),


          ],
          onTap: navigationTapped,

        )
    );
  }
}