
import 'package:flutter/material.dart';

class ForthProvider extends ChangeNotifier{
  bool temp = true;
  bool col = true;
  // bool tcol = true;
  int colIndex = 0;
  bool t = false;
  // int r = 0;
  Color c = Colors.pink;
  Color d = Colors.black;
  double fontSize = 20;
  double sliderFontSize = 20;
  List<String> font = ["f1","f2","f3","f4","f5","f6","f7","f8","f9","f10","f11","f12","f13","f14","f15","f16","f17","f18","f19"];
  String currentFont = "f1";
  String selectedFont = "f1";
  String emoji = "🤨🤨🤨🤨";
  int emojiCount = 0;
  double imageSize = 200;
  void changeBackgroundColor(int index) {
    t = true;
    colIndex = index;
    notifyListeners();
  }

  void changeTextColor(Color color) {
    t = false;
    d = color;
    notifyListeners();
  }

  void changeFont(String selectedFont) {
    currentFont = selectedFont;
    notifyListeners();
  }

  void changeFontSize(double fontSize) {
    sliderFontSize = fontSize;
    notifyListeners();
  }

  void changeEmoji(String selectedEmoji) {
    emoji = selectedEmoji;
    notifyListeners();
  }

  void changeTextSize(double size) {
    fontSize = size;
    notifyListeners();
  }

  void incrementEmojiCount() {
    emojiCount++;
    notifyListeners();
  }

  void decrementEmojiCount() {
    if (emojiCount > 0) {
      emojiCount--;
      notifyListeners();
    }
  }

  void changeImageSize(double size) {
    imageSize = size;
    notifyListeners();
  }
}