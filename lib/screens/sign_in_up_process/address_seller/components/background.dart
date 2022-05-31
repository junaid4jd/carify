import 'dart:convert';

import 'package:carify_app/controller/seller_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import '../../car_details_seller/car_details_screen.dart';
import '../../gender_type_seller/gender_screen_landlord.dart';

class Background extends StatefulWidget {
  final Widget child;

  Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  // Text Styles
  final wordButtons = const TextStyle(fontSize: 20, color: Color(0xFF00ff00));

  final parStyle = const TextStyle(fontSize: 13, color: Colors.black);

  final titles = const TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Colors.black);

  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  TextEditingController _controller = TextEditingController();
  bool showSuggestion = true;
  var uuid = new Uuid();

  String _sessionToken = '1234567890';

  List<dynamic> _placeList = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print('value is changing');
      _onChanged();
      // _placeList.clear();
    });
  }

  _onChanged() {
    print('value is changing');
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();

      });
    }
    getSuggestion(_controller.text);
    // if(_controller.text.isEmpty){
    //   setState(() {
    //
    //   });
    // }
    _placeList.clear();
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = "AIzaSyCbAY1eHIK6zocHjHJwHV-wA6-CHdUGCUY";
    String type = '(regions)';

    try {
      String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request = '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);
      print('mydata');
      print(data);
      if (response.statusCode == 200) {
        setState(() {
          _placeList = json.decode(response.body)['predictions'];
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      // toastMessage('success');
    }
  }

  @override
  Widget build(BuildContext context) {
    var sellerVM = Provider.of<SellerProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size; //provides total height and width of screen for users
    return SizedBox(
        height: size.height,
        width: double.infinity,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Back arrow
              Positioned(
                top: 105,
                right: 340,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  color: const Color(0xFF00ff00),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GenderScreenSeller()));
                  },
                ),
              ),

              // Screen title
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Align(
                    alignment: const Alignment(0.0, -0.6),
                    child: Text(
                      'My address is',
                      style: GoogleFonts.roboto(
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
                        padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                        child: TextField(
                            controller: _controller,
                            onChanged: (value){
                              if(value.isEmpty){
                                setState(() {
                                  showSuggestion=true;
                                });
                              }
                            },
                            style: TextStyle(fontSize: 18),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 4), isDense: true, hintText: "534 yonge St")),
                      ))),

              // Text
              Positioned(
                child: Align(
                  alignment: const Alignment(-0.43, -0.20),
                  child: Text('buyers will see this',
                      style: GoogleFonts.roboto(textStyle: parStyle, fontSize: 16, color: const Color(0xFF757575))),
                ),
              ),
              Container(
                height: 80,
                width: 250,
                // color: Colors.grey[100],
                child: showSuggestion ==true ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _placeList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        setState(() {
                          _controller.text = _placeList[index]["description"];
                          showSuggestion = false;
                          _placeList.clear();
                        });

                      },
                      child: ListTile(
                        title: Text(_placeList[index]["description"]),
                      ),
                    );
                  },
                ) : SizedBox(),
              ),

              // Continue button
              Positioned(
                  top: 660,
                  child: ElevatedButton(
                      child: Text("Continue", style: GoogleFonts.roboto(textStyle: buttonText)),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF00ff00),
                          minimumSize: const Size(320, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                      onPressed: () {
                        sellerVM.changeAddress = _controller.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CarDetailsSeller()),
                        );
                      })),
            ],
          ),
        ));
  }
}
