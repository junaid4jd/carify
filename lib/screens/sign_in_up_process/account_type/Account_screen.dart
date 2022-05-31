
import 'package:carify_app/controller/seller_provider.dart';
import 'package:carify_app/screens/sign_in_up_process/signup_welcome/sign_in_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';




class AccountType extends StatefulWidget {

  @override
  _AccountType createState() => _AccountType();
}


class _AccountType extends State<AccountType> {

  String acc_type = '';

  AccountType get phone => phone;
  final titles = const TextStyle(fontSize: 27,  fontWeight: FontWeight.bold, color: Color(0xFF00ff00));
  final buttonText = const TextStyle(fontSize: 22,  fontWeight: FontWeight.bold, color: Color(0xFF000000));



  @override
  Widget build(BuildContext context) {

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

              //Background Orange Design
              const Positioned(
                top: 285,
                child: Image(
                    image: AssetImage("assets/images/swirly_bg.png"),
                    alignment: Alignment.center,
                    //height: 610,
                    width: 414,
                    fit: BoxFit.fitWidth
                ),
              ),


              // Back arrow
              Positioned(
                top: 75,
                right: 345,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  color: const Color(0xFF00ff00),
                  onPressed: () {Navigator.of(context).pop();
                  },
                ),
              ),



              // Text
              Positioned(
                child: Align(
                  alignment: const Alignment(0.20, -0.70),
                  child: SizedBox(
                      width:300,
                      child: Text('The start of your new ''car experience', textAlign: TextAlign.center,
                          style: GoogleFonts.roboto (
                              textStyle: titles
                          )
                      )
                  ),
                ),
              ),
              // Tenant Button
              Positioned(
                  top: 460,
                  child: ElevatedButton(
                      child: Text("Buyer", style: GoogleFonts.roboto(
                          textStyle: buttonText
                      )
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFFFFFFF),
                          minimumSize: const Size(320, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed: () async {
                        // var buyerVM = Provider.of<BuyerProvider>(context,listen: false);
                        // buyerVM.changeUid = widget.userId;
                        // buyerVM.changeMobile = widget.phone;
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SignInUpScreen(usertype: 'Buyer')),
                      );
                      acc_type = "Buyer";
                      //AuthMethods().addUserInfo(phoneNum: widget.phone, accountType: acc_type);
                        //print(UserID);

                      //await users.doc(UserID).update({'AccountType': account_type, 'UserID': UserID}).then((value) => print('Account Type Added'));

                      }
                  )
              ),

              // Landlord Button
              Positioned(
                  top: 570,
                  child: ElevatedButton(
                      child: Text("Seller", style: GoogleFonts.roboto(
                          textStyle: buttonText
                      )
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFFFFFFF),
                          minimumSize: const Size(320, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed: () async {

                        var sellerVM = Provider.of<SellerProvider>(context,listen: false);
                        // sellerVM.changeuid = widget.userId;
                        // sellerVM.changePhone = widget.phone;
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SignInUpScreen(usertype: 'Seller')),
                      );
                      // acc_type = "Landlord";
                      //
                      // await users.add({'PhoneNumber': widget.phone, 'AccountType': acc_type}).then((value) => print('Account Type Added.'));
                      //await users.doc(UserID).set({'PhoneNumber': widget.phone, 'AccountType': account_type});




                      }
                  )
              ),

              // Subletting Button
              // Positioned(
              //     top: 680,
              //     child: ElevatedButton(
              //         child: Text("Seller", style: GoogleFonts.roboto(
              //             textStyle: buttonText
              //         )
              //         ),
              //         style: ElevatedButton.styleFrom(
              //             primary: const Color(0xFFFFFFFF),
              //             minimumSize: const Size(320, 50),
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10)
              //             )
              //         ),
              //         onPressed: () {
              //
              //           Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context) => const SellerName()),
              //         );
              //         }
              //     )
              // ),


            ],
          ),
        )
    );
  }
}
