import 'dart:io';

import 'package:carify_app/models/buyer_model.dart';
import 'package:carify_app/models/seller_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyFireStoreService {
  String? uid;

  MyFireStoreService({this.uid});


  final CollectionReference buyerCollection = FirebaseFirestore.instance.collection('Buyer');

  final CollectionReference sellerCollection = FirebaseFirestore.instance.collection('Seller');

  Future<void> insertBuyer(BuyerModel buyer) async {

    try {
      print('insert option is called with ${buyer.userid}');
      return await buyerCollection.doc(buyer.userid).set(buyer.toMap());
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
      print('Exception at insertion is : $e');
    }
  }

  Future<String?> uploadPictureToStorage(File imageFile,String userId)async {
    print('I will upload this pic ${imageFile.path}');
    String? url;
    try{
      FirebaseStorage _storage = FirebaseStorage.instance;
      Reference  reference = _storage.ref().child("images/$userId");
      UploadTask uploadTask = reference.putFile(imageFile);
      uploadTask.then((res) async{
        url = await res.ref.getDownloadURL();
        print('URl is $uid');
      });
    }catch(e){
      print('This is exception while uploading file $e');
    }

    return url;
  }

  Future<void> insertSeller(SellerModel seller) async {
    try {
      print('insert option is called ');
      //var options = SetOptions(merge: true);
      // print(options);
      return await sellerCollection.doc(seller.userid).set(
        seller.toMap()
      );
    } catch (e) {
      print('Exception is $e');
    }
  }
}
