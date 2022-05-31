import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/components.dart';


class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

// Text Styles
final wordButtons = const TextStyle(fontSize: 20, color: Color(0xFFfb7c14));
final parStyle = const TextStyle(fontSize: 13, color: Colors.black);
final titles = const TextStyle(fontSize: 37,  fontWeight: FontWeight.bold, color: Colors.black);
final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);


class _ProfileScreenState extends State<ProfileScreen> {
  final List _chips = [
    {
      'text': 'Non Smoker',
    },
    {
      'text': 'Has a pet',
    },
    {
      'text': 'Regular Partier',
    },
    {
      'text': 'Very Organized',
    },
    {
      'text': 'Cleans 1-2 Times a week',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: mainColor,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 27, right: 27),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/profile.png',
              height: 183,
              width: 189,
            ),
            SizedBox(height: 16),
            Text(
              "John, 23 ",
              style: TextStyle(
                color: Color(0xff424242),
                fontSize: 24,
              ),
            ),
            SizedBox(height: 6),
            const Text(
              "Gender: Male\nProfession: Student\nSchool: Stanford Uni\nYear: 2",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff757575),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 19,
              children: _chips
                  .map((chip) => Chip(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Color(0xff9E9E9E)),
                      label: Text(
                        chip['text'],
                        style: TextStyle(color: Color(0xff9E9E9E),fontSize: 18),
                      )))
                  .toList(),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {DefaultTabController.of(context)?.animateTo(1);
              },
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF00ff00),
                  minimumSize: const Size(320, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  )
              ),
              child: Text("Continue", style: GoogleFonts.roboto(
                  textStyle: buttonText
              )
              ),
            ),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
