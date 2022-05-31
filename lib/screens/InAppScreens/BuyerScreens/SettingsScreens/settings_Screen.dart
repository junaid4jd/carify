import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/components.dart';
import 'personal_tab_screen.dart';
import 'car_tab_screen.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

final wordButtons = const TextStyle(fontSize: 20, color: Color(0xFFfb7c14));
final parStyle = const TextStyle(fontSize: 13, color: Colors.black);
final titles = const TextStyle(fontSize: 37,  fontWeight: FontWeight.bold, color: Colors.black);
final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);


class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () => Get.back(),
          //   icon: const Icon(
          //     Icons.arrow_back,
          //     color: mainColor,
          //   ),
          // ),
          title: const Text(
            "Settings",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 19, horizontal: 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 18, right: 18),
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
                        "Personal",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Housing",
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
              SizedBox(height: 27),
              Expanded(
                child: TabBarView(children: [
                  PersonalTabScreen(),
                  CarsTabScreen(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
