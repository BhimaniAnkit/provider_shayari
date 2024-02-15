import 'package:flutter/cupertino.dart';

class ThirdProvider extends ChangeNotifier{
  PageController controller = PageController();
  int colInd = 0;
  bool t = false;
  int currentPosition = 0;
  List<String> shayariList = [];

  void initialize(List<String> shaayri,int initialPosition){
    shayariList = shaayri;
    currentPosition = initialPosition;
    controller = PageController(initialPage: currentPosition);
  }

  void changeColor(int index){
    t = true;
    colInd = index;
    notifyListeners();
  }

  void onPageChanged(int value){
    currentPosition = value;
    notifyListeners();
  }
  void goToPage(int page){
    if(page >= 0 && page < shayariList.length){
      currentPosition = page;
      controller.jumpToPage(currentPosition);
      notifyListeners();
    }
  }
}