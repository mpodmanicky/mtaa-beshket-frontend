//<Martin Podmanicky>

import 'package:beshket/models/cart_item.dart';
import 'package:beshket/models/event.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems; // Return an unmodifiable list

  void addToCart(Event event) {
    _cartItems.add(CartItem(event, 1));
    notifyListeners();
  }

  void resetCart() {
    _cartItems = [];
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    _cartItems.remove(cartItem);
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var cartItem in _cartItems) {
      double itemPrice = double.parse(cartItem.event.price);
      totalPrice += itemPrice * cartItem.quantity;
    }
    return totalPrice;
  }
}
