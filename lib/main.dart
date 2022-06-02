import 'package:carify_app/controller/buyer_provider.dart';
import 'package:carify_app/controller/seller_provider.dart';
import 'package:carify_app/screens/sign_in_up_process/account_type/Account_screen.dart';
import 'package:carify_app/screens/sign_in_up_process/car_description/car_desc.dart';
import 'package:carify_app/screens/sign_in_up_process/name_info_buyer/name_screen_buyer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'controller/authentication_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (BuildContext context) {
          return AuthProvider();
        },
      ),
      ChangeNotifierProvider<BuyerProvider>(
        create: (BuildContext context) {
          return BuyerProvider();
        },
      ),
      ChangeNotifierProvider<SellerProvider>(
        create: (BuildContext context) {
          return SellerProvider();
        },
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
       // home:
       //  SignInUpScreen(),
      home: AccountType(),
    ),
  ));
}
