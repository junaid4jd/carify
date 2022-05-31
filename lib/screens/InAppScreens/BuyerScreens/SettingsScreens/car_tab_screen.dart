

import 'package:carify_app/screens/InAppScreens/BuyerScreens/SettingsScreens/update_address.dart';
import 'package:carify_app/screens/InAppScreens/BuyerScreens/SettingsScreens/update_car_details.dart';
import 'package:carify_app/screens/InAppScreens/BuyerScreens/SettingsScreens/update_features.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/components.dart';


class CarsTabScreen extends StatelessWidget {
  const CarsTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Cars ",
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
                onPressed: () { Navigator.push(context, MaterialPageRoute(
                builder: (context) => const AddressBuyerScreenUpdate()),
                );
                },
                child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.location_on,
                              size: 25,
                              color: mainColor,
                            ),
                            SizedBox(width: 3),
                            Text(
                              "Address",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "565 yonge",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9e9e9e),
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: mainColor,
                            )
                          ],
                        ),
                    ),



              TextButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const UpdateCarDetailsBuyer()),
                );
                },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(width: 3),
                  const Text(
                    "Car Details",
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
                  )
                ],
              ),
          ),

              TextButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const UpdateFeaturesBuyer()),
              );
              },
                child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(width: 3),
                  const Text(
                    "Features",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Settings",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff9e9e9e),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: mainColor,
                  )
                ],
              ),
        )
            ],
          ),
        ),
      ],
    );
  }
}
