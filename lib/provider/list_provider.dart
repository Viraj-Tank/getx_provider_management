import 'package:flutter/material.dart';

class ListProvider with ChangeNotifier {

  var itemsList = [];

  addItem(int index) {
    itemsList.add(index);
    notifyListeners();
  }

  removeItem(int index) {
    itemsList.remove(index);
    notifyListeners();
  }

  int totalCount() {
    return itemsList.length;
  }

}