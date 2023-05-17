import 'dart:collection';

import 'package:flutter/material.dart';

class CartItem {
  int id = -1;
  String name = '';
}

class CartModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<CartItem> _items = [];
  int _justNumber = 0;

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _items.length * 42;

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(CartItem item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void increase() {
    _justNumber += 1;
    notifyListeners();
  }

  void decrease() {
    _justNumber -= 1;
    notifyListeners();
  }

  String count() => '$_justNumber';
}
