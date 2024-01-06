import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatusProvider extends ChangeNotifier {
  void accept(id, collection) {
    FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .update({'status': 1});
    notifyListeners();
  }

  void reject(id, collection) {
    FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .update({'status': 2});
    notifyListeners();
  }
}

class NotificationProvider extends ChangeNotifier {
  Future addNotifiaction(
      matter, content, time, date, BuildContext context) async {
    FirebaseFirestore.instance.collection('Notification').add({
      'heading': matter.text,
      'content': content.text,
      'time': time.format(context),
      'date': DateFormat('dd/mm/yy').format(date)
    });
    notifyListeners();
  }
}
