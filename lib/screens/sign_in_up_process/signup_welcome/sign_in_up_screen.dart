import 'package:flutter/material.dart';
import 'components/body.dart';

class SignInUpScreen extends StatelessWidget {
   SignInUpScreen({Key? key,required this.usertype}) : super(key: key);
  String usertype ;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Body(userType: usertype),
    );
  }
}

