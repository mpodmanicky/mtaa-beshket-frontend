//<Martin Podmanicky>

import 'package:beshket/models/cart_item.dart';
import 'package:beshket/models/event.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems; // Return an unmodifiable list

  void addToCart(Event event) {
    // Check if event already exists in cart
    final existingItem = _cartItems.firstWhere((item) => item.event == event);
    if (existingItem != null) {
      existingItem.setQuantity =
          existingItem.getQuantity + 1; // Use the existing quantity property
    } else {
      _cartItems.add(CartItem(event, 1));
    }
    notifyListeners();
  }

  void resetCart() {
    _cartItems = [];
    notifyListeners();
  }
}
