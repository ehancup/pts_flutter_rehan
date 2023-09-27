import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modal/product_modal.dart';

class CartModel extends ChangeNotifier {
  List<Cart> _carts = [];

  List<Cart> get carts => [..._carts];

  void saveCart(Cart product) {
    final found = _carts.indexWhere((element) {
      print(element);
      return true;
    });
    print(found);
    notifyListeners();
  }

}