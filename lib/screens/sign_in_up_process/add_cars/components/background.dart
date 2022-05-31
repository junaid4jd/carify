
import 'package:carify_app/screens/sign_in_up_process/features_seller/features_seller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../controller/seller_provider.dart';
import '../../address_seller/address_screen_seller.dart';
import '../../seller_car_pics/seller_car_pics_screen.dart';



class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  // Text Styles
  final wordButtons = const TextStyle(fontSize: 20, color: Color(0xFF00ff00));
  final ParStyle = const TextStyle(fontSize: 13, color: Colors.black);
  final titles = const TextStyle(fontSize: 20,  fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
  final buttonText2 = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey);



  @override
  Widget build(BuildContext context) {
    var sellerVM = Provider.of<SellerProvider>(context,listen: false);
    Size size = MediaQuery
        .of(context)
        .size; //provides total height and width of screen for users
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Column(
         // alignment: Alignment.center,
          children: <Widget>[

            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.9,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    color: Color(0xFF00ff00),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FeaturesSeller())
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            // Back Arrow
            Expanded(child: Container()),
            // Screen title
            Align(
              alignment: const Alignment(0.0, -0.6),
              child: Text("You're almost Done",
                style: GoogleFonts.roboto (
                  textStyle: titles,
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(
              height: size.height * 0.025,
            ),
            // Text
            Padding(
              padding: const EdgeInsets.only(left: 50,right:50),
              child: Align(
                alignment: const Alignment(0.0, -0.20),
                child: Text('Get ready to upload photos of your\n car',
                    style: GoogleFonts.roboto (
                        textStyle: ParStyle,
                        fontSize: 16,
                        color: const Color(0xFF757575)
                    ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.025,
            ),

            // Continue Button
            ElevatedButton(
                child: Text("Continue", style: GoogleFonts.roboto(
                    textStyle: buttonText
                )
                ),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF00ff00),
                    minimumSize:  Size(size.width * 0.9, size.height * 0.07),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    )
                ),
                onPressed: () async {
                 await sellerVM.saveUser();
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  AddPhoto()),
                );
                }
            ),

            SizedBox(
              height: size.height * 0.025,
            ),
            // Add Property Button
            SizedBox(
                height: size.height * 0.07,
                width: size.width * 0.9,
                child: TextButton(
                    child: Text("Add car",  style: GoogleFonts.roboto (
                      textStyle: buttonText2,
                    )
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                side: const BorderSide(color: Colors.grey, width: 3)
                            )
                        )
                    ),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const AddressScreenSeller()),
                      );
                    }
                )
            ),

            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}