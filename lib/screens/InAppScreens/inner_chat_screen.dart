import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/components.dart';
import 'SellerScreens/profile_screen.dart';

class InnerChat extends StatefulWidget {
  InnerChat({Key? key}) : super(key: key);

  @override
  State<InnerChat> createState() => _InnerChatState();
}

class _InnerChatState extends State<InnerChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: mainColor,
            ),
          ),
          title: const Text(
            "Nissan",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff424242),
              fontSize: 24,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () => Get.to(ProfileScreen()),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile_img.png"),
                  radius: 20,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  width: 73.47,
                  height: 19.24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(71),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1e000000),
                        blurRadius: 17,
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: const Text(
                    "Thrusday",
                    style: const TextStyle(
                      fontSize: 12,
                      color: mainColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .7,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22.80),
                          topRight: Radius.circular(22.80),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(22.80),
                        ),
                        color: Color(0xffeeeeee),
                      ),
                      child: const Text(
                        "Hi can I book a viewing for this house? ",
                        style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 16,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "9:27 AM",
                      style: TextStyle(
                        color: Color(0xffbdbdbd),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // width: 215,
                            width: MediaQuery.of(context).size.width * .7,

                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(22.85),
                                topRight: Radius.circular(22.85),
                                bottomLeft: Radius.circular(22.85),
                                bottomRight: const Radius.circular(0),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xff00ff00),
                                  Color(0xff00ff00),
                                  const Color(0xff00ff00)
                                ],
                              ),
                            ),
                            child: const Text(
                              "Yes for sure, I am available from 3-7pm tomorrow.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "12:19 PM",
                            style: TextStyle(
                              color: Color(0xffbdbdbd),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 9,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.add_circle_outlined,
                              color: mainColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: mainColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Iconsax.gallery5,
                              color: mainColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.mic,
                              color: mainColor,
                            ),
                          )
                        ],
                      ),
                    )
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * .11,
                      width: MediaQuery.of(context).size.width * .5,
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            hintText: "Search",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            prefixIcon: const Icon(
                              Iconsax.emoji_happy,
                              size: 20,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(31),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(31),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
