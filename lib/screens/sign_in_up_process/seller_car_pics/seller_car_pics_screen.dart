import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/components.dart';
import '../add_cars/add_cars_screen.dart';

class AddPhoto extends StatefulWidget {

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AddCars()),
            );
          }
          ,
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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 13,
          ),
          const Text(
            "Hold, drag and drop to reorder",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff757575),
              fontSize: 16,
            ),
          ),
          Expanded(
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                padding:
                EdgeInsets.only(top: 18, bottom: 18, left: 20, right: 20),
                children: List.generate(20, (index) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage('assets/add_img.png'),
                                fit: BoxFit.cover)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/add_img.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Stack(
                          children: [
                            Container(
                              height: 19,
                              width: 19,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            Positioned(
                              top: -10,
                              bottom: 8,
                              right: -14,
                              child: isSelected
                                  ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSelected = !isSelected;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: mainColor,
                                  size: 22,
                                ),
                              )
                                  : IconButton(
                                onPressed: () {
                                  setState(
                                        () {
                                      isSelected = !isSelected;
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.check_circle,
                                  color: mainColor,
                                  size: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                })),
          ),
        ],
      ),
    );
  }
}
