import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/components.dart';
import 'SettingsScreens/settings_Screen.dart';

class DiscoverProfileDetails extends StatefulWidget {
  DiscoverProfileDetails({Key? key}) : super(key: key);

  @override
  State<DiscoverProfileDetails> createState() => _DiscoverProfileDetailsState();
}

class _DiscoverProfileDetailsState extends State<DiscoverProfileDetails> {
  late int defaultValue;

  // int select = 0;

  final List _chips = [
    {
      'text': 'Push to start',
    },
    {
      'text': 'Wifi',
    },
    {
      'text': 'Bluetooth',
    },
    {
      'text': 'touch screen',
    },
    {
      'text': 'mini-fridge',
    },
    {
      'text': 'A/C',
    },
    {
      'text': 'TV',
    },
    {
      'text': 'Leather Seats',
    },
  ];

  bool isSlected = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: mainColor,
          ),
        ),
        actions:  [
          IconButton(
            onPressed: () => Get.to(SettingsScreen()),
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Image.asset(
                  'assets/images/discover.png',
                  fit: BoxFit.cover,
                  // height: 430,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Spacer(flex: 5),
            ],
          ),
          //WIll be replaced by Tabpage selector
          Positioned(
            top: (height / 2) - 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 7.66,
                  height: 7.66,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 7),
                Container(
                  width: 7.66,
                  height: 7.66,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 7),
                Container(
                  width: 7.66,
                  height: 7.66,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 7),
                Container(
                  width: 7.66,
                  height: 7.66,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: (height / 2) - 65,
            left: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 30,
                bottom: 10,
              ),
              width: MediaQuery.of(context).size.width,
              height: height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "166 Broughdale Ave",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: mainColor,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "10 miles",
                          style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 5,
                      children: _chips
                          .map(
                            (chip) => Chip(
                          label: Text(
                            chip['text'],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          backgroundColor:
                          isSlected ? Colors.grey : Colors.white,
                          side: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      )
                          .toList(),
                    ),
                    SizedBox(height: 14),
                    Divider(),
                    SizedBox(height: 14),
                    const Text(
                      "\$650/month. \n12 month lease. Leather Seats,  TV Included\n",
                      style: TextStyle(
                        color: Color(0xff757575),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 2),
                    Divider(),
                    Container(
                      width: 320,
                      height: 73,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xfff5f5f5),
                      ),
                      child: const Text(
                        "Nice Car with large seats.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Message Landlord',
                          style: TextStyle(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (height / 2) - 65,
            right: 25,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Image.asset(
                'assets/icons/arrow_down_icon.png',
                height: 37,
                width: 37,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
