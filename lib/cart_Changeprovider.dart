// Logic/Code for ChangeNotifier Provider

import 'package:flutter/material.dart';

class CartChangeprovider extends ChangeNotifier {
  List<Map<String, dynamic>> cartDetails = [];

  void addProduct(String img, String productName, double price) {
    cartDetails.add({'imageUrl': img, 'name': productName, 'price': price});
    notifyListeners();
  }

  void removeProduct(String img, String productName, double price) {
    cartDetails.removeWhere(
      (item) =>
          item['imageUrl'] == img &&
          item['name'] == productName &&
          item['price'] == price,
    );
    notifyListeners();
  }
}
