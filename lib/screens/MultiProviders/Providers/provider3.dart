import 'package:flutter/foundation.dart';

class Provider3  with ChangeNotifier{
int count = 0;
  void increment() {
    count++;
        notifyListeners();

  }

}