import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/components.dart';
import 'discover_details.dart';


class ApprovedCar extends StatefulWidget {
  ApprovedCar({Key? key}) : super(key: key);

  @override
  State<ApprovedCar> createState() => _ApprovedCarState();
}

class _ApprovedCarState extends State<ApprovedCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: mainColor,
          ),
        ),
        title: const Text(
          "Approved Car",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 18,
        padding: EdgeInsets.only(top: 18, bottom: 18),
        children: List.generate(10, (index) {
          return GestureDetector(
            onTap: () => Get.to(DiscoverProfileDetails()),
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: 150,
              child: Column(
                children: [
                  Expanded(
                    flex: 70,
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15)),
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
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: mainColor,
                        borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15)),
                      ),
                      child: const Text(
                        "30000KM",
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
    );
  }
}
