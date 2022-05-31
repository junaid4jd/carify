import 'package:flutter/material.dart';

import '../../../widgets/components.dart';

class AllLikes extends StatefulWidget {
  AllLikes({Key? key}) : super(key: key);

  @override
  State<AllLikes> createState() => _AllLikesState();
}

class _AllLikesState extends State<AllLikes> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(height: 70),
                Container(
                  width: double.infinity,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    border: Border.all(
                      color: Color(0xffbdbdbd),
                      width: 2,
                    ),
                  ),

                  child: const TabBar(
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(23)),
                        color: mainColor,
                        shape: BoxShape.rectangle),
                    indicatorColor: mainColor,
                    unselectedLabelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text(
                          "Unapproved",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Approved",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],

                  ),
                ),

                SizedBox(height: 5),
                Expanded(
                  child: TabBarView(
                    children: [
                      TabScreen(),
                      TabScreen_2(),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
