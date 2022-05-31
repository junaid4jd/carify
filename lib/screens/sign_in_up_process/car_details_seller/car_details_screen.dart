import 'package:carify_app/controller/seller_provider.dart';
import 'package:carify_app/screens/sign_in_up_process/address_seller/address_screen_seller.dart';
import 'package:carify_app/screens/sign_in_up_process/features_seller/features_seller.dart';
import 'package:carify_app/utilites/general_utilites.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



class CarDetailsSeller extends StatefulWidget {
  const CarDetailsSeller({Key? key}) : super(key: key);

  @override
  _CarDetailsSeller createState() => _CarDetailsSeller();
}
// options for radio buttons
enum Sublet { Yes, No }
enum Property { House, Apartment, Basement }

class _CarDetailsSeller extends State<CarDetailsSeller> {
  Sublet? _sublet = Sublet.No;
  Property? type = Property.House;

  int carLeaserSelectedValue = 1;
  int carTypeSelectedValue = 3;


  bool carLeaser = false;
  String carType = 'Non';


  int selectedValue = 0;

  // Text Styles
  final wordButtons = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF424242));
  final smallText = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF424242));
  final radioButtonText = const TextStyle(
      fontSize: 15, color: Color(0xFF424242), fontWeight: FontWeight.bold);
  final titles = const TextStyle(
      fontSize: 37, fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  // Range for options
  double distance = 35;
  double numberOfBedrooms = 3;
  double priceRangeMin = 300;
  double priceRangeMax = 800;
  double durationOfLease = 6;
  RangeValues priceRange = const RangeValues(600, 1500);

  @override
  Widget build(BuildContext context) {
    var sellerVm = Provider.of<SellerProvider>(context,listen: false);
    Size size =
        MediaQuery
            .of(context)
            .size; //provides total height and width of scr
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(

            //  alignment: Alignment.center,
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
                              MaterialPageRoute(builder: (context) => const AddressScreenSeller())
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Screen title
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Align(
                    alignment: const Alignment(0.0, -0.6),
                    child: Text(
                      'Car Details',
                      style: GoogleFonts.roboto(
                        textStyle: titles,
                        fontSize: 44,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // # of bedrooms
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 96.67,
                    width: 370,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF424242),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: SizedBox(
                              height: 20,
                              child: Row(
                                children: [
                                  Text(
                                  "Distance Driven",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: const Color(0xFF424242)
                                  ),
                                ), const Spacer(), Text(
                                  "30000 km",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF757575),
                                      fontSize: 12
                                  ),
                                )
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 25,
                            child: SliderTheme(
                              data: SliderThemeData(
                                overlayShape: SliderComponentShape.noThumb,
                              ),
                              child: Slider(
                                value: numberOfBedrooms,
                                divisions: 10,
                                min: 1,
                                max: 10,
                                activeColor: const Color(0xFF00ff00),
                                onChanged: (value) =>
                                    setState(() => numberOfBedrooms = value),
                              ),),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [Text(
                                "1 bedroom",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF757575),
                                    fontSize: 12
                                ),
                              ), const Spacer(),
                                Text(
                                  "9+ bedrooms",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF757575),
                                      fontSize: 12
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // $ range
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 96.67,
                    width: 370,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF424242),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15,left:10,right:10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [Text(
                                "Price Range per Car",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: const Color(0xFF424242)
                                ),
                              ), const Spacer(), Text(
                                "\$6560-240033",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF757575),
                                    fontSize: 12
                                ),
                              )
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 25,
                            child: SliderTheme(
                              data: SliderThemeData(
                                overlayShape: SliderComponentShape.noThumb,
                              ),
                              child: RangeSlider(
                                values: priceRange,
                                divisions: 4001,
                                min: 0,
                                max: 4000,
                                activeColor: const Color(0xFF00ff00),
                                onChanged: (RangeValues values) {
                                  setState(() {
                                    priceRange = values;
                                  });
                                },
                              ),),
                          ),
                          Row(
                            children: [Text(
                              "\$0",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF757575),
                                  fontSize: 12
                              ),
                            ), const Spacer(),
                              Text(
                                "\$40004",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF757575),
                                    fontSize: 12
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Sublet or no
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 85.67,
                      width: 370,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF424242),
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 10),
                                  child: SizedBox(
                                    height: 20,
                                    child: Row(
                                      children: [Text(
                                        "Is this car a leaser?",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: const Color(0xFF424242)
                                        ),
                                      ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(right: 45),

                                    child: SizedBox(
                                      child: Row(
                                          children:  [
                                            RadioItem(values: 1,itemName: 'Yes',group: carLeaserSelectedValue,onChange: (val){
                                              print('Hello this is val $val');
                                              setState(() {
                                                carLeaserSelectedValue = val;
                                                carLeaser = true;
                                              });
                                            }),
                                            Divider(
                                              height: 2,
                                              thickness: 1,
                                              color: Color(0xFFC4C4C4),
                                            ),
                                            Spacer(),

                                            RadioItem(values: 2,itemName: 'No',group: carLeaserSelectedValue,onChange: (val){
                                              print('Hello this is val $val');
                                              setState(() {
                                                carLeaserSelectedValue = val;
                                                carLeaser = false;
                                              });
                                            }),
                                            Divider(
                                              height: 2,
                                              thickness: 1,
                                              color: Color(0xFFC4C4C4),
                                            )



                                          ]
                                      ),
                                    )
                                )
                              ]
                          )
                      )
                  ),
                ),
                // Property Type
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 85.67,
                      width: 370,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF424242),
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 10),
                                  child: SizedBox(
                                    height: 20,
                                    child: Row(
                                      children: [Text(
                                        "Car Type",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: const Color(0xFF424242)
                                        ),
                                      ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Row(
                                      children:  [
                                        RadioItem(values: 3,itemName: 'SUV',group: carTypeSelectedValue,onChange: (val){
                                          print('Hello this is val $val');
                                          setState(() {
                                            carTypeSelectedValue = val;
                                            carType = 'SUV';
                                          });
                                        }),
                                        Divider(
                                          height: 2,
                                          thickness: 0.5,
                                          color: Color(0xFFC4C4C4),
                                        ),


                                        RadioItem(values: 4,itemName: 'Sedan',group: carTypeSelectedValue,onChange: (val){
                                          print('Hello this is val $val');
                                          setState(() {
                                            carTypeSelectedValue = val;
                                            carType = 'Sedan';
                                          });
                                        }),
                                        Divider(
                                          height: 2,
                                          thickness: 0.5,
                                          color: Color(0xFFC4C4C4),
                                        ),

                                        RadioItem(values: 5,itemName: 'Truck',group: carTypeSelectedValue,onChange: (val){
                                          print('Hello this is val $val');
                                          setState(() {
                                            carTypeSelectedValue = val;
                                            carType = 'Truck';
                                          });
                                        }),
                                        Divider(
                                          height: 2,
                                          thickness: 0.5,
                                          color: Color(0xFFC4C4C4),
                                        )



                                      ]
                                  ),
                                )
                              ]
                          )
                      )
                  ),
                ),
                // Duration of lease
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 96.67,
                    width: 370,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF424242),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: SizedBox(
                              height: 20,
                              child: Row(
                                children: [Text(
                                  "Duration of Lease",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: const Color(0xFF424242)
                                  ),
                                ), const Spacer(), Text(
                                  "3 months",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF757575),
                                      fontSize: 12
                                  ),
                                )
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 25,
                            child: SliderTheme(
                              data: SliderThemeData(
                                overlayShape: SliderComponentShape.noThumb,
                              ),
                              child: Slider(
                                value: durationOfLease,
                                divisions: 12,
                                min: 1,
                                max: 12,
                                activeColor: const Color(0xFF00ff00),
                                onChanged: (value) =>
                                    setState(() => durationOfLease = value),
                              ),),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Row(
                              children: [Text(
                                "1 month",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF757575),
                                    fontSize: 12
                                ),
                              ), const Spacer(),
                                Text(
                                  "12+ months",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF757575),
                                      fontSize: 12
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: size.height * 0.01,
                ),
                ElevatedButton(
                    child: Text("Continue", style: GoogleFonts.roboto(
                        textStyle: buttonText
                    )
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF00ff00),
                        minimumSize: const Size(320, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        )
                    ),
                    onPressed: () async {
                      print('These are values $numberOfBedrooms ${priceRange.start} ${priceRange.end} $durationOfLease $carType $carLeaser' );
                      sellerVm.changeDistanceDriven = numberOfBedrooms.toString();
                      sellerVm.changePriceRangeStart = priceRange.start.toString();
                      sellerVm.changePriceRangeEnd = priceRange.end.toString();
                      sellerVm.changeLeaseDuration = durationOfLease.toString();
                      sellerVm.changeLeaserCar = carLeaser.toString();
                      sellerVm.changeCarType = carType.toString();
                      if(await GeneralUtilities.checkInternetConnection() != null){
                        try{
                          await sellerVm.saveUser();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FeaturesSeller()),
                          );
                        }
                        catch(e){
                          Fluttertoast.showToast(msg: 'Something went wrong');
                        }
                      }
                      else{
                        Fluttertoast.showToast(msg: 'Please check internet');
                      }
                    // );
                    }
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),

              ]
          )
      ),
    );
  }

  Widget RadioItem({required int values,required String  itemName,required int group,required var onChange}){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:15),
          child: Text(
            itemName,
            style: const TextStyle(fontSize: 16.0,color: Color(0xFF757575)),
          ),
        ),
        Radio(
            fillColor: MaterialStateColor.resolveWith((states) => const Color(0xFF00ff00)),
            value: values,
            groupValue: group,
            onChanged: onChange
        )
      ],
    );
  }
}



