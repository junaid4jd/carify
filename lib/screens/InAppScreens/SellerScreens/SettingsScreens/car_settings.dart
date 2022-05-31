
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/components.dart';
import '../../BuyerScreens/SettingsScreens/update_address.dart';


class PropertySettingsSeller extends StatelessWidget {
  const PropertySettingsSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () => Get.back(),
          //   icon: const Icon(
          //     Icons.arrow_back,
          //     color: mainColor,
          //   ),
          // ),
          title: const Text(
            "Car Settings",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),





        body: Column(


          children: [
            Divider(color: Colors.white),
            Divider(color: Colors.white),
            Divider(color: Colors.white),


            Align(
                alignment: Alignment.center,
                child:ElevatedButton(
                    child: Text("Add Car", style: GoogleFonts.roboto(

                    )
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF00ff00),
                        minimumSize: const Size(350, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)
                        )
                    ),
                    onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  PropertySettingsSeller()),
                    );
                    }
                )
            ),
            Divider(color: Colors.white),
            Divider(color: Colors.white),
            Divider(color: Colors.white),

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

                        SizedBox(width: 3),
                        Text(
                          "Nissan Altima",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff9e9e9e),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 6),
                        Spacer(),
                        Text(
                          "Edit Car",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff9e9e9e),
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: mainColor,
                        )
                      ],
                    ),
                  ),



                  TextButton(
                    onPressed: () { Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const AddressBuyerScreenUpdate()),
                    );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [

                        SizedBox(width: 3),
                        Text(
                          "Nissan Altima",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff9e9e9e),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 6),
                        Spacer(),
                        Text(
                          "Edit Car",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff9e9e9e),
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: mainColor,
                        )
                      ],
                    ),
                  ),

                  TextButton(
                    onPressed: () { Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const AddressBuyerScreenUpdate()),
                    );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [

                        SizedBox(width: 3),
                        Text(
                          "Nissan Altima",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff9e9e9e),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 6),
                        Spacer(),
                        Text(
                          "Edit Car",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff9e9e9e),
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: mainColor,
                        )
                      ],
                    ),
                  ),


                  Divider(color: Colors.white,),
                  Divider(color: Colors.white,),
                  Divider(color: Colors.white,),
                  Divider(color: Colors.white,),

                  ElevatedButton(
                      child: Text("Add Car", style: GoogleFonts.roboto(
                      )
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF00ff00),
                          minimumSize: const Size(350, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)
                          )
                      ),
                      onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  PropertySettingsSeller()),
                      );
                      }
                  )
                ],
              ),
            ),
          ],
        )
    );

  }
}
