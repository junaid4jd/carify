import 'package:carify_app/controller/buyer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../about_buyer/about_buyer_screen.dart';
import '../car_details_buyer/car_details_screen.dart';

class FeaturesBuyer extends StatefulWidget {
  const FeaturesBuyer({Key? key}) : super(key: key);

  @override
  _FeaturesBuyerState createState() => _FeaturesBuyerState();
}

class _FeaturesBuyerState extends State<FeaturesBuyer> {
  int selectedValue = 0;
  final wordButtons = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF424242));
  final smallText = const TextStyle(fontSize: 13, color: Color(0xFF424242));
  final titles = const TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    var buyerVm = Provider.of<BuyerProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size; //provides total height and width of scr
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Stack(alignment: Alignment.center, children: <Widget>[
        Container(
          height: 800,
        ),

        //Back Button
        Positioned(
          top: 105,
          right: 340,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: const Color(0xFF00ff00),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CarDetailsBuyer()));
            },
          ),
        ),

        //Screen Title
        Positioned(
          top: 145,
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Align(
              alignment: const Alignment(0.0, -0.6),
              child: Text(
                'Preferred\n Car features',
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
        Positioned(
          top: 260,
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Align(
              alignment: const Alignment(0.0, -0.6),
              child: Text(
                'Let us know what you are looking for\n in your car. features can be added\n or removed later',
                style: GoogleFonts.roboto(
                  textStyle: smallText,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Push to Start',
                    style: TextStyle(fontSize: 18, color: Color(0xFF00ff00)),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xFF00ff00),
                    value: Provider.of<BuyerProvider>(context).pushToStart,
                    onChanged: (bool? value) {
                      print('This is value i will push to start $value');
                      buyerVm.setPushToStartValue(value!);
                      // checkValueVm.setcheckValue(value!);
                    },
                  ),
                  Text(
                    'Wifi',
                    style: TextStyle(fontSize: 18, color: Color(0xFF00ff00)),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xFF00ff00),
                    value: Provider.of<BuyerProvider>(context).wifi,
                    onChanged: (bool? value) {
                      print('This is value i will wifi $value');
                      buyerVm.setWifiValue(value!);
                      // checkValueVm.setcheckValue(value!);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Touch Screen',
                    style: TextStyle(fontSize: 18, color: Color(0xFF00ff00)),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xFF00ff00),
                    value: Provider.of<BuyerProvider>(context).touchScreen,
                    onChanged: (bool? value) {
                      print('This is value i will toch to screen $value');
                      buyerVm.setTouchScreenValue(value!);
                      // checkValueVm.setcheckValue(value!);
                    },
                  ),
                  Text(
                    'Bluetooth',
                    style: TextStyle(fontSize: 18, color: Color(0xFF00ff00)),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xFF00ff00),
                    value: Provider.of<BuyerProvider>(context).bluetooth,
                    onChanged: (bool? value) {
                      print('This is value i will set bluetooth $value');
                      buyerVm.setBluetoothValue(value!);
                      // checkValueVm.setcheckValue(value!);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Mini-Fridge',
                        style: TextStyle(fontSize: 18, color: Color(0xFF00ff00)),
                      ),
                      SizedBox(width: size.width * 0.12),
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Color(0xFF00ff00),
                        value: Provider.of<BuyerProvider>(context).miniFridge,
                        onChanged: (bool? value) {
                          print('This is value i will set minifridge $value');
                          buyerVm.setMiniFridgeValue(value!);
                          // checkValueVm.setcheckValue(value!);
                        },
                      ),
                    ],
                  ),
                  Text(
                    'A/C',
                    style: TextStyle(fontSize: 18, color: Color(0xFF00ff00)),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xFF00ff00),
                    value: Provider.of<BuyerProvider>(context).ac,
                    onChanged: (bool? value) {
                      print('This is value i will set ac $value');
                      buyerVm.setAcValue(value!);
                      // checkValueVm.setcheckValue(value!);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'TV',
                    style: TextStyle(fontSize: 18, color: Color(0xFF00ff00)),
                  ),
                  SizedBox(width: size.width * 0.2),
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xFF00ff00),
                    value: Provider.of<BuyerProvider>(context).tv,
                    onChanged: (bool? value) {
                      print('This is value i will set tv $value');
                      buyerVm.setTvValue(value!);
                      // checkValueVm.setcheckValue(value!);
                    },
                  ),
                  Text(
                    'Leather Seats',
                    style: TextStyle(fontSize: 18, color: Color(0xFF00ff00)),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xFF00ff00),
                    value: Provider.of<BuyerProvider>(context).leatherSeat,
                    onChanged: (bool? value) {
                      print('This is value i will set leatherseat $value');
                      buyerVm.setLeatherSeatValue(value!);
                      // checkValueVm.setcheckValue(value!);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),

        // Positioned(
        //     top: 340,
        //   left:30,
        //   child: customCheckbox(
        //     text: "Push to start",
        //   ),
        // ),
        // Positioned(
        //   top: 340,
        //   right:30,
        //   child: customCheckbox(
        //     text: "Wifi",
        //   ),
        // ),
        // Positioned(
        //   top: 400,
        //   left:30,
        //   child: customCheckbox(
        //     text: "Bluetooth",
        //   ),
        // ),
        // Positioned(
        //   top: 400,
        //   right:30,
        //   child: customCheckbox(
        //     text: "Touch Screen",
        //   ),
        // ),
        // Positioned(
        //   top: 460,
        //   left:30,
        //   child: customCheckbox(
        //     text: "Mini-Fridge",
        //   ),
        // ),
        // Positioned(
        //   top: 460,
        //   right:30,
        //   child: customCheckbox(
        //     text: "A/C",
        //   ),
        // ),
        // Positioned(
        //   top: 520,
        //   left:30,
        //   child: customCheckbox(
        //     text: "TV",
        //   ),
        //
        // ),
        // Positioned(
        //   top: 520,
        //   right:30,
        //   child: customCheckbox(
        //     text: "Leather Seats",
        //   ),
        // ),
        Positioned(
            top: 650,
            child: ElevatedButton(
                child: Text(
                  "Continue",
                  style: GoogleFonts.roboto(textStyle: buttonText),
                ),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF00ff00),
                    minimumSize: const Size(320, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutBuyer()),
                  );
                })),
      ])),
    );
  }
}
//
// // Custom Checkbox
// class customCheckbox extends StatefulWidget {
//   final String text;
//
//   customCheckbox({required this.text});
//
//   @override
//   State<customCheckbox> createState() => _customCheckboxState();
// }
//
// class _customCheckboxState extends State<customCheckbox> {
//   List<String> preferredCar = [];
//   bool _isSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _isSelected = !_isSelected;
//           _isSelected ? print('THis ${widget.text}is true') : print('This ${widget.text} is false');
//         });
//       },
//
//       // Button Design
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(width: 2, color: _isSelected ? Colors.grey : Color(0xFF00ff00)),
//           borderRadius: const BorderRadius.all(Radius.circular(20)),
//           color: Colors.white,
//           // borderRadius: BorderRadius.circular(25),
//
//           // Text Design
//         ),
//         child: Align(
//           child: Text(
//             widget.text.isNotEmpty ? widget.text : "text",
//             style: TextStyle(
//               color: _isSelected ? Colors.grey : Color(0xFF00ff00),
//               fontSize: 20,
//             ),
//           ),
//         ),
//         width: 160,
//         height: 42,
//       ),
//     );
//   }
// }
