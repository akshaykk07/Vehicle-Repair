import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class StatusProvider extends ChangeNotifier {
  void accept(id, collection) {
    FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .update({'status': 1});
    notifyListeners();
  }

  void reject(id, collection) async{
   await FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .update({'status': 2});
    notifyListeners();
  }
}


