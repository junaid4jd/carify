import 'package:carify_app/controller/buyer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../address_buyer/address_screen_buyer.dart';
import '../car_details_buyer/car_details_screen.dart';



class YearBuyerScreen extends StatefulWidget {
  const YearBuyerScreen({Key? key}) : super(key: key);

  @override
  State<YearBuyerScreen> createState() => _YearBuyerScreenState();
}

// Text Styles
final wordButtons =  const TextStyle(fontSize: 20, color: Color(0xFF00ff00));
final ParStyle = const TextStyle(fontSize: 13, color: Colors.black);
final titles = const TextStyle(fontSize: 37,  fontWeight: FontWeight.bold, color: Colors.black);
final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

class _YearBuyerScreenState extends State<YearBuyerScreen> {
  TextEditingController yearController = TextEditingController();
  List<String> years = ['2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020','2021'];
  String selectedYear = '';
  @override
  Widget build(BuildContext context) {
    final buyerData = Provider.of<BuyerProvider>(context);
    Size size = MediaQuery
        .of(context)
        .size; //provides total height and width of screen for users
    return SizedBox(
        height: size.height,
        width: double.infinity,
        child: Scaffold(
          backgroundColor: Colors.white,

          body: Stack(
            alignment: Alignment.center,
            children: <Widget>[



              // Back Arrow
              Positioned(
                top: 105,
                right: 340,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  color: const Color(0xFF00ff00),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddressScreenBuyer())
                    );
                  },
                ),
              ),



              // Screen title
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(left:50,right:50),
                  child: Align(
                    alignment: const Alignment(0.0, -0.6),
                    child: Text('My Year',
                      style: GoogleFonts.roboto (
                        textStyle: titles,
                        fontSize: 44,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),


              // Text Field
               Positioned(
                  child: Align(
                      alignment: Alignment(0, -0.30),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(85, 0, 95, 30),
                        child: DropdownButton(
                          // value: selectedYear,
                          // underline: Text("Select Year",style: TextStyle(fontSize: 16),),
                          hint: selectedYear != "" ? Text("$selectedYear",style: TextStyle(fontSize: 16,color: Colors.black)) : Text('Select year',style: TextStyle(fontSize: 16,color: Colors.black),),
                          isExpanded: true,
                          iconEnabledColor: Color(0xFF00ff00),
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          dropdownColor: Color(0xFF00ff00),
                          focusColor: Colors.black,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: years.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedYear = newValue!;
                            });
                          },
                        ),




                        // DropdownButton(
                        //   items: years.map((String items) {
                        //     return DropdownMenuItem(
                        //       value: items,
                        //       child: Text(items),
                        //     );
                        //   }).toList(),
                        //
                        //   onChanged: (val){
                        //     setState(() {
                        //       selectedYear = val.toString();
                        //     });
                        //   },
                        // )
                        // TextField(
                        //     controller: yearController,
                        //     style: TextStyle(fontSize: 18),
                        //     keyboardType: TextInputType.name,
                        //     decoration: InputDecoration(
                        //         contentPadding: EdgeInsets.only(bottom: 4),
                        //         isDense: true,
                        //         hintText: "Undergrad Second Year"
                        //     )),
                      )
                  )
              ),


              // Text
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(left: 70,right:100),
                  child: Align(
                    alignment: const Alignment(0.0, -0.20),
                    child: Text('Your program will be shown',
                        style: GoogleFonts.roboto (
                            textStyle: ParStyle,
                            fontSize: 16,
                            color: const Color(0xFF00ff00)
                        )
                    ),
                  ),
                ),
              ),



              // Continue Button
              Positioned(
                  top: 660,
                  child: ElevatedButton(
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
                      onPressed: () {
                        print('This is selected value $selectedYear');
                        buyerData.changeYearr = selectedYear;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CarDetailsBuyer()),
                      );
                      }
                  )
              ),


            ],
          ),
        )
    );
  }


}
