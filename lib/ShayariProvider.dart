import 'package:flutter/foundation.dart';
import 'Data.dart';

class ShayariProvider extends ChangeNotifier{
  List<bool> selectedItems = [];
  List<bool> isSelected = List.filled(Data.shayariname.length, false);
  // List<bool> selectedItems = List.filled(Data.shayariname.length, false);
  List<String> shayariList = [];

  void loadShayariList(int index) {
    switch (index) {
      case 0:
        shayariList = Data.best;
          // shayariList.assignAll(Data.motivationalshayari);
        break;
      case 1:
        shayariList = Data.friendship;
          // shayariList.assignAll(Data.lifeshayari);
        break;
      case 2:
        shayariList = Data.funny;
        // shayariList.assignAll(Data.mohabbatshayari);
        break;
      case 3:
        shayariList = Data.god;
        // shayariList.assignAll(Data.yaadshayari);
        break;
      case 4:
        shayariList = Data.inspiration;
        // shayariList.assignAll(Data.othershayari);
        break;
      case 5:
        shayariList = Data.life;
        // shayariList.assignAll(Data.rajnitishayari);
        break;
      case 6:
        shayariList = Data.love;
        // shayariList.assignAll(Data.premshayari);
        break;
      case 7:
        shayariList = Data.memories;
        // shayariList.assignAll(Data.dardshayari);
        break;
      case 8:
        shayariList = Data.other;
        break;
      case 9:
        shayariList =Data.politics;
        break;
      case 10:
        shayariList = Data.love_shayari;
        break;
      case 11:
        shayariList = Data.dard;
        break;
      case 12:
        shayariList = Data.alcohol;
        break;
      }
    // Initialize selected items list with false for each item
    selectedItems = List.generate(shayariList.length, (index) => false);
    print("shayariList:= ${shayariList}");
    notifyListeners();
  }

  void selectItem(int index) {
    selectedItems[index] = !selectedItems[index];
    notifyListeners();
  }

  void updateSelection(int index) {
    isSelected[index] = !isSelected[index];
    notifyListeners();
  }

  void showshayariList(){
    print("shayariList:=${shayariList}");
    print("selectedItem:= ${selectedItems}");
  }
}