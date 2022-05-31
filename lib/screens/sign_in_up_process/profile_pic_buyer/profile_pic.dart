import 'dart:io';

import 'package:carify_app/controller/buyer_provider.dart';
import 'package:carify_app/utilites/general_utilites.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../NavBarBuyer.dart';
import '../about_buyer/about_buyer_screen.dart';

class ProfilePicBuyer extends StatefulWidget {
  const ProfilePicBuyer({Key? key}) : super(key: key);

  @override
  _ProfilePicBuyerState createState() => _ProfilePicBuyerState();
}

class _ProfilePicBuyerState extends State<ProfilePicBuyer> {
  int selectedValue = 0;
  final wordButtons = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF424242));
  final smallText = const TextStyle(fontSize: 13, color: Color(0xFF424242));
  final titles = const TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  File? _image;

  chooseImageGallery() async {
    try {
      final _image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (_image == null) return;
      final getImage = File(_image.path);

      setState(() {
        this._image = getImage;
      });
    } on PlatformException catch (e) {
      print("failed to pick image $e");
    }
  }

  chooseImageCamera() async {
    try {
      final _image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (_image == null) return;
      final getImage = File(_image.path);

      setState(() {
        this._image = getImage;
      });
    } on PlatformException catch (e) {
      print("failed to pick image $e");
    }
  }

  Widget imageProfile(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 170.0,
          backgroundImage: AssetImage("assets/images/default_profile_pic.png"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final buyerData = Provider.of<BuyerProvider>(context);

    Size size = MediaQuery.of(context).size; //provides total height and width of scr
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Stack(alignment: Alignment.center, children: <Widget>[
        Container(
          height: 800,
        ),

        Positioned(
          top: 240,
          child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/default_profile_pic.png"),
              radius: 161,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: _image != null
                    ? Image.file(
                        _image!,
                        width: 500,
                        fit: BoxFit.cover,
                      )
                    : imageProfile(context),
              )),
        ),

        Positioned(
            top: 675,
            right: 50,
            child: ElevatedButton(
                child: Text(
                  "Gallery",
                  style: GoogleFonts.roboto(textStyle: buttonText),
                ),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF00ff00),
                    minimumSize: const Size(135, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                onPressed: () {
                  chooseImageGallery();
                })),

        Positioned(
            top: 675,
            right: 227,
            child: ElevatedButton(
                child: Text(
                  "Camera",
                  style: GoogleFonts.roboto(textStyle: buttonText),
                ),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF00ff00),
                    minimumSize: const Size(135, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                onPressed: () {
                  chooseImageCamera();
                })),

        //  Positioned(
        //   top: 237,
        //   child: Image.asset("assets/images/profile_pic_border.png",
        //     scale: 0.82
        //     ,
        //
        // ),
        // ),

        // Back Arrow
        Positioned(
          top: 105,
          right: 340,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: const Color(0xFF00ff00),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutBuyer()));
            },
          ),
        ),

        // Screen Title Text
        Positioned(
          top: 145,
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Align(
              alignment: const Alignment(0.0, -0.6),
              child: Text(
                'Profile Picture',
                style: GoogleFonts.roboto(
                  textStyle: titles,
                  fontSize: 44,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),

        // Text
        const Positioned(top: 200, child: Text("Click the plus to add a photo")),

        //Profile Picture
        // Positioned(
        //     top: 250,
        //     child: imageProfile(context)
        //
        // ),

        // const Positioned(
        //     right: 95,
        //     top: 480,
        //     child: Icon(
        //         Icons.add_circle_rounded,
        //         color: Color(0xFFfb7c14),
        //       size: 55,
        //
        //     ),
        // ),

        // Positioned(child: CircleAvatar(
        //   backgroundImage: AssetImage("assets/images/default_profile_pic.png")
        //
        //
        // )
        // ),

        // Text
        Positioned(
          top: 600,
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Align(
              alignment: const Alignment(0.0, -0.6),
              child: Text(
                'This is the last step until you can start \nswiping on cars! Upload your profile\n  picture and get started.',
                style: GoogleFonts.roboto(
                  textStyle: smallText,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),

        // Continue Button
        Positioned(
            top: 745,
            child: ElevatedButton(
                child: Text(
                  "Continue",
                  style: GoogleFonts.roboto(textStyle: buttonText),
                ),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF00ff00),
                    minimumSize: const Size(320, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                onPressed: () async {
                  if (await GeneralUtilities.checkInternetConnection() != null) {
                    EasyLoading.show(status: 'Saving All Buyer Info');
                    print('I am gonna save this picture ${_image!.path}');
                    try {
                      await buyerData.saveBuyerProfilePicture(File(_image!.path)).whenComplete(() async {
                        await buyerData.saveUser().whenComplete(() {
                          EasyLoading.showSuccess('User Saved');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NavBarBuyer()),
                          );
                        });
                      });
                    } catch (e) {
                      EasyLoading.dismiss();
                      Fluttertoast.showToast(msg: 'Something went Wrong');
                    }
                  } else {
                    Fluttertoast.showToast(msg: 'Please check internet');
                  }
                })),
      ])),
    );
  }
}

//
//
// Widget bottomSheet() {
//   return Container(
//     height: 100.0,
//     margin: const EdgeInsets.symmetric(
//       horizontal: 20,
//       vertical: 20,
//     ),
//       child: Column(children:  <Widget> [
//         const Text(
//           "Choose Profile Photo",
//           style: TextStyle(
//             fontSize: 20.0,
//           )
//         ),
//         const SizedBox(height: 20),
//         Row(mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextButton.icon(
//               icon: const Icon(Icons.camera_enhance_rounded),
//               label: const Text("Camera"),
//               onPressed: () {
//                 chooseImage();
//
//               },
//             ),
//
//             TextButton.icon(
//               icon: const Icon(Icons.browse_gallery_rounded),
//               label: const Text("Gallery"),
//               onPressed: () {
//                 imagePickerGallery();
//               },
//             )
//           ])
//       ])
//   );
//
// }
//
//
//
// Widget imageProfile(BuildContext context){
//   return Stack(
//     children:   <Widget>[
//       CircleAvatar(
//         radius: 150.0,
//         backgroundImage: AssetImage("assets/images/default_profile_pic.png"),
//
//       ),
//     ],
//   );
//
// }

final ImagePicker _picker = ImagePicker();

void imagePickerGallery() async {
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  print(image!.path);
}

void imagePickerCamera() async {
  final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  print(image!.path);
}
