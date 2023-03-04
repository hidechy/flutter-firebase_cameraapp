// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainProvider = ChangeNotifierProvider((ref) => MainModel());

class MainModel extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  Future<void> createUser({required BuildContext context}) async {
    final userData = <String, dynamic>{
      'username': 'hideyuki',
      'uid': 'firstUser',
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc('firstUser')
        .set(userData);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('user create')),
    );

    notifyListeners();
  }
}
