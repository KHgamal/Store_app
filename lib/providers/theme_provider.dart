
import 'package:flutter/material.dart';

class DarkThemeProvider extends ChangeNotifier {
  bool isSwitched = false;
  void toggleSwitch(bool value) {
      isSwitched==true?isSwitched=false:isSwitched=true;
      notifyListeners();
  }
}