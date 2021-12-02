import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String name;
  int triesLeft;
  int score;

  AppState({
    this.name = '', 
    this.triesLeft = 0, 
    this.score = 0
  });

  void setName(String name) {
    this.name = name;
  }

  void answer(bool isFake) {
    if (!isFake) {
      score++;
    }
    triesLeft--;
    notifyListeners();
  }
}