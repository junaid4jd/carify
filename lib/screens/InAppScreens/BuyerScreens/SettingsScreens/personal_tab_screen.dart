
import 'package:carify_app/screens/InAppScreens/BuyerScreens/SettingsScreens/update_about_you.dart';
import 'package:carify_app/screens/InAppScreens/BuyerScreens/SettingsScreens/update_program.dart';
import 'package:carify_app/screens/InAppScreens/BuyerScreens/SettingsScreens/update_school.dart';
import 'package:carify_app/screens/InAppScreens/BuyerScreens/SettingsScreens/update_work_status.dart';
import 'package:carify_app/screens/InAppScreens/BuyerScreens/SettingsScreens/update_year.dart';

import 'package:flutter/material.dart';

import '../../../../widgets/components.dart';


class PersonalTabScreen extends StatefulWidget {
  PersonalTabScreen({Key? key}) : super(key: key);

  @override
  State<PersonalTabScreen> createState() => _PersonalTabScreenState();
}

class _PersonalTabScreenState extends State<PersonalTabScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [

                Container(
                  width: 113,
                  height: 113,
                  decoration: BoxDecoration(
                    border: Border.all(color: mainColor, width: 2),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: const Color(0xffDAD9D7),
                    size: 100,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 34,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.mode_edit_outline_outlined,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 11),
            const Text(
              "John Johnson\nAge: 29\nGender: Male",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff757575),
                fontSize: 20,
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "School ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff9e9e9e),
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 3),

              Container(
                padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [

                      TextButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white


                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SchoolBuyerScreenUpdate())
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            const SizedBox(width: 3),
                            const Text(
                              "School",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "Stanford University",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9e9e9e),
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: mainColor,
                            ),
]
                        ),
                      ),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white


                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProgramBuyerScreenUpdate())
                        );
                      },
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            const SizedBox(width: 3),
                            const Text(
                              "Program",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "Business",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9e9e9e),
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(

                              Icons.arrow_forward_rounded,
                              color: mainColor,
                            ),
                          ]
                      ),
                    ),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white


                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const YearBuyerScreenUpdate())
                        );
                      },
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            const SizedBox(width: 3),
                            const Text(
                              "Year",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "Second Year",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9e9e9e),
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(

                              Icons.arrow_forward_rounded,
                              color: mainColor,
                            ),
                          ]
                      ),
                    ),
                       ]
    ),
    ),

            SizedBox(height: 10),

            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Work ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff9e9e9e),
                  fontSize: 16,
                ),
              ),
            ),


            Container(
              padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                  children: [
                    TextButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white


                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const UpdateWorkStatusBuyer())
                        );
                      },                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            const SizedBox(width: 3),
                            const Text(
                              "Work Status",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "Part-time",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9e9e9e),
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(

                              Icons.arrow_forward_rounded,
                              color: mainColor,
                            ),
                          ]
                      ),
                    ),
                  ]
              ),
            ),

            SizedBox(height: 10),

            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "About",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff9e9e9e),
                  fontSize: 16,
                ),
              ),
            ),



            Container(
              padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                  children: [
                    TextButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white


                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const UpdateAboutBuyer())
                        );
                      },
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            const SizedBox(width: 3),
                            const Text(
                              "About You",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "Settings",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9e9e9e),
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: mainColor,
                            ),
                          ]
                      ),
                    ),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white


                      ),
                      onPressed: () {

                      },
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            const SizedBox(width: 3),
                            const Text(
                              "Change Email ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "Email",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9e9e9e),
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: mainColor,
                            ),
                          ]
                      ),
                    ),

                    TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white


    ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const YearBuyerScreenUpdate())
                        );
                      },
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            const SizedBox(width: 3),
                            const Text(
                              "Change ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "Western University",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9e9e9e),
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: mainColor,
                            ),
                          ]
                      ),
                    ),
                  ]
              ),
            ),
    ]
    )

    );


  }
}
