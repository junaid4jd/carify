import 'dart:io';

import 'package:carify_app/services/storage_services.dart';
import 'package:carify_app/utilites/general_utilites.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/components.dart';

class AddPhoto extends StatefulWidget {
  AddPhoto({Key? key}) : super(key: key);

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  BucketService bucketVm = BucketService();
  List<XFile> _images = [];
  final picker = ImagePicker();
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white24,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: mainColor,
          ),
        ),
        title: const Text(
          "Change photos",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _images.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () async {
                if (_images.isNotEmpty && await GeneralUtilities.checkInternetConnection() != null) {
                  await bucketVm.uploadSellerCarPictures(_images,context);
                } else {
                  Fluttertoast.showToast(msg: 'Please select images or Check internet');
                }
              },
              label: Text('  Upload Pictures  '),
              backgroundColor: Colors.blue)
          : SizedBox(),
      backgroundColor: Colors.white,
      body: GridView.builder(
          itemCount: _images.length + 1,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return index == 0
                ? Center(
                    child: IconButton(
                      // color: Colors.r,
                      icon: Icon(Icons.add, size: size.width * 0.08),
                      onPressed: () {
                        pickCarImages();
                      },
                    ),
                  )
                : Image.file(
                    File(_images[index - 1].path),
                    // width: size.width * 0.05,
                    // height: size.width * 0.05,
                    fit: BoxFit.cover,
                  );
          }),

      // Column(
      //   children: [
      //     const SizedBox(
      //       height: 13,
      //     ),
      //     // const Text(
      //     //   "Hold, drag and drop to reorder",
      //     //   textAlign: TextAlign.center,
      //     //   style: TextStyle(
      //     //     color: Color(0xff757575),
      //     //     fontSize: 16,
      //     //   ),
      //     // ),
      //     Expanded(
      //       child: GridView.count(
      //           shrinkWrap: true,
      //           crossAxisCount: 3,
      //           mainAxisSpacing: 10,
      //           crossAxisSpacing: 10,
      //           padding:
      //           EdgeInsets.only(top: 18, bottom: 18, left: 20, right: 20),
      //           children: List.generate(20, (index) {
      //             return Stack(
      //               children: [
      //                 Container(
      //                   decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(10),
      //                       image: const DecorationImage(
      //                           image: AssetImage('assets/add_img.png'),
      //                           fit: BoxFit.cover)),
      //                   child: ClipRRect(
      //                     borderRadius: BorderRadius.circular(10),
      //                     child: Image.asset(
      //                       'assets/add_img.png',
      //                       fit: BoxFit.cover,
      //                       width: double.infinity,
      //                     ),
      //                   ),
      //                 ),
      //                 Positioned(
      //                   bottom: 10,
      //                   right: 10,
      //                   child: Stack(
      //                     children: [
      //                       Container(
      //                         height: 19,
      //                         width: 19,
      //                         decoration: BoxDecoration(
      //                           color: Colors.white,
      //                           borderRadius: BorderRadius.circular(15),
      //                         ),
      //                       ),
      //                       Positioned(
      //                         top: -10,
      //                         bottom: 8,
      //                         right: -14,
      //                         child: isSelected
      //                             ? IconButton(
      //                           onPressed: () {
      //                             setState(() {
      //                               isSelected = !isSelected;
      //                             });
      //                           },
      //                           icon: const Icon(
      //                             Icons.add_circle,
      //                             color: mainColor,
      //                             size: 22,
      //                           ),
      //                         )
      //                             : IconButton(
      //                           onPressed: () {
      //                             setState(
      //                                   () {
      //                                 isSelected = !isSelected;
      //                               },
      //                             );
      //                           },
      //                           icon: const Icon(
      //                             Icons.check_circle,
      //                             color: mainColor,
      //                             size: 22,
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             );
      //           })),
      //     ),
      //   ],
      // ),
    );
  }

  pickCarImages() async {
    final pickedImages = await picker.pickMultiImage();
    setState(() {
      if (pickedImages!.isNotEmpty) {
        _images.addAll(pickedImages);
      }
    });
  }
}
