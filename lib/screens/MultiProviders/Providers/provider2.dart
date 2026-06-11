import 'package:flutter/material.dart';

class Provider2 with  ChangeNotifier {

  int count = 0;
  void increment() {
    count++;
        notifyListeners();

  }
}