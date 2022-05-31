

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../screens/InAppScreens/BuyerScreens/discover_details.dart';
import '../screens/InAppScreens/SellerScreens/add_photos_screen.dart';
import '../screens/InAppScreens/SellerScreens/profile_screen.dart';


const mainColor = Color(0xFF00ff00);

class SwipPage extends StatelessWidget {
  const SwipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: size.height*0.03,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/honda_civic.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: size.height*0.4,
              ),
            ),

           // Expanded(child: Container()),

            Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height*0.03,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Honda Civic",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height*0.05,
                  ),

                  Container(
                   // color: Colors.green,
                    child: Column(
                      children: [

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: mainColor,
                              size: 25,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "10 kilometers",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            const SizedBox(width: 150),
                            GestureDetector(
                              onTap: () => Get.to(DiscoverProfileDetails()),
                              child: Image.asset(
                                'assets/icons/info_icon.png',
                                height: 20,
                                width: 20,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height*0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: [
                              const Text(
                                "6 rooms. /month.\n12 month lease. Unfurnished,\nPush to start Included",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/icons/close_icon.png',
                                height: 30,
                                width: 30,
                              ),
                              // Spacer(),
                              const Icon(
                                Icons.favorite_outline,
                                color: mainColor,
                                size: 50,
                              ),
                              // Spacer(),
                              Icon(
                                Icons.star_border_outlined,
                                color: mainColor,
                                size: 50,
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),


                ],
              ),
            ),
            SizedBox(
              height: size.height*0.03,
            ),
          ],
        ),
      ),
    );
  }
}

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "These tenants have shown interest in your home",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff424242),
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 54,
          width: 321,
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                side: MaterialStateProperty.all(BorderSide(color: mainColor, width: 1)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
            ),
            child: const Text(
              "Filter By Property",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF00ff00),
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 20,
            padding: EdgeInsets.only(top: 10, bottom: 18),
            children: List.generate(6, (index) {
              return GestureDetector(
                onTap: () => Get.to(ProfileScreen()),
                child: Container(
                  // height: 80,
                  // height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.asset(
                            'assets/images/honda_civic.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 30,
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: mainColor,
                            borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(15)),
                          ),
                          child: const Text(
                            "John\n John",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width,
          child: TextButton(
            onPressed: () {DefaultTabController.of(context)?.animateTo(1);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(mainColor),
                side: MaterialStateProperty.all(BorderSide(color: mainColor, width: 1)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                )
            ),
            child: const Text(
              "Approve All",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class TabScreen_2 extends StatelessWidget {
  const TabScreen_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "These car buyers have shown interest in your home",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff424242),
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width,
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                side: MaterialStateProperty.all(BorderSide(color: mainColor, width: 1)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
            child: const Text(
              "Filter By car brand",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF00ff00),
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 20,
            padding: EdgeInsets.only(top: 10, bottom: 18),
            children: List.generate(6, (index) {
              return GestureDetector(
                onTap: () => Get.to(AddPhoto()),
                child: Container(
                  // height: 80,
                  // height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.asset(
                            'assets/images/honda_civic.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 30,
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: mainColor,
                            borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(15)),
                          ),
                          child: const Text(
                            "John\n John",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.07,
        //   width: MediaQuery.of(context).size.width,
        //   child: TextButton(
        //     onPressed: () => Get.to(ApprovedHouse()),
        //     style: ButtonStyle(
        //         backgroundColor: MaterialStateProperty.all(mainColor),
        //         side: MaterialStateProperty.all(BorderSide(color: mainColor, width: 1)),
        //         shape: MaterialStateProperty.all(
        //           RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(100),
        //           ),
        //         )),
        //     child: const Text(
        //       "Approve All",
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 20,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}




class FilledButton extends StatelessWidget {
  final String text;
  FilledButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(mainColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}




// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
// child: Stack(
// children: [
// ClipRRect(
// borderRadius: BorderRadius.circular(10),
// child: Image.asset(
// "assets/images/honda_civic.jpg",
// fit: BoxFit.cover,
// width: double.infinity,
// ),
// ),
// Positioned(
// right: 25,
// bottom: 25,
// left: 25,
// child: Container(
// color: Colors.green,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// children: const [
// Text(
// "Honda Civic",
// style: TextStyle(
// color: Colors.white,
// fontSize: 24,
// fontWeight: FontWeight.w700,
// ),
// ),
// ],
// ),
// const SizedBox(height: 10),
// Row(
// mainAxisSize: MainAxisSize.min,
// children: [
// const Icon(
// Icons.location_on,
// color: mainColor,
// size: 15,
// ),
// const Text(
// "10 kilometers",
// style: TextStyle(
// color: Colors.white,
// fontSize: 14,
// ),
// ),
// const SizedBox(width: 160),
// GestureDetector(
// onTap: () => Get.to(DiscoverProfileDetails()),
// child: Image.asset(
// 'assets/icons/info_icon.png',
// height: 20,
// width: 20,
// fit: BoxFit.scaleDown,
// ),
// ),
// ],
// ),
// const SizedBox(height: 8),
// const Text(
// "6 rooms. /month.\n12 month lease. Unfurnished,\nPush to start Included",
// style: TextStyle(
// color: Colors.white,
// fontSize: 16,
// ),
// ),
// const SizedBox(height: 13),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// mainAxisSize: MainAxisSize.max,
// children: [
// Image.asset(
// 'assets/icons/close_icon.png',
// height: 19,
// width: 19,
// ),
// // Spacer(),
// const Icon(
// Icons.favorite_outline,
// color: mainColor,
// ),
// // Spacer(),
// Icon(
// Icons.star_border_outlined,
// color: mainColor,
// )
// ],
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// );

