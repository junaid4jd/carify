
import 'package:carify_app/screens/InAppScreens/BuyerScreens/SettingsScreens/settings_Screen.dart';
import 'package:carify_app/screens/InAppScreens/BuyerScreens/approved_car_screen.dart';

import 'package:carify_app/screens/InAppScreens/chat_screen.dart';
import 'package:carify_app/widgets/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarBuyer extends StatefulWidget {
  const NavBarBuyer({Key? key}) : super(key: key);

  @override
  State<NavBarBuyer> createState() => _NavBarBuyerState();
}

class _NavBarBuyerState extends State<NavBarBuyer> {
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
     // backgroundColor: Colors.green,
      body: PageView(
      children: [
        SwipPage(),
        ApprovedCar(),
        ChatScreen(),
        SettingsScreen()

      ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
        bottomNavigationBar: CupertinoTabBar(
          height: 50,
          items: [

            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Icon(Icons.person, // 8D8B8BFF
                      color: _page==0? Color(0xFF00ff00): Color(0xFFD3D3D3) //Colors.white
                  ),
                ),
                label:'',
                backgroundColor: Color(0xFF00ff00)),

            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Icon(Icons.favorite,
                      color: _page==1? Color(0xFF00ff00): Color(0xFFD3D3D3)
                  ),
                ),
                label:'',
                backgroundColor: Color(0xFF00ff00)),

            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Icon(Icons.chat_bubble_rounded,
                      color: _page==2? Color(0xFF00ff00): Color(0xFFD3D3D3)
                  ),
                ),
                label:'',
                backgroundColor: Color(0xFF00ff00)),

            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Icon(Icons.person,
                      color: _page==3? Color(0xFF00ff00): Color(0xFFD3D3D3)
                  ),
                ),
                label:'',
                backgroundColor: Color(0xFF00ff00)),




          ],
          onTap: navigationTapped,

        )
    );
  }
}