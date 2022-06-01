import 'dart:io';

import 'package:carify_app/controller/seller_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

class BucketService {
  CollectionReference? imgRef;
  firebase_storage.Reference? ref;

  Future uploadSellerCarPictures(List imageList,BuildContext context) async {
    print('I am gonna upload these images ${imageList.length}');
    try {
      for (var img in imageList) {
        File file = File(img.path);
        ref = firebase_storage.FirebaseStorage.instance.ref().child('${Provider.of<SellerProvider>(context,listen: false).userid}/${Path.basename(file.path)}');
        await ref?.putFile(file).whenComplete(() async {
          await ref?.getDownloadURL().then((value) async {
            print('Hey i got the URL');
            imgRef?.add({'url': value});
          });
        });
      }
    } catch (e) {
      print('This is exception in bucket service $e');
    }
  }
}
