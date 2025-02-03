import 'package:flutter/material.dart';
import 'package:shivaydairy/modalclass.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  double get totalAmount {
    return _items.values
        .fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addItem(String id, String name, double price, String imageUrl) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          price: existingItem.price,
          quantity: existingItem.quantity + 1,
          imageUrl: existingItem.imageUrl,
          weight: existingItem.weight,
        ),
      );
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(
            id: id,
            name: name,
            price: price,
            quantity: 1,
            imageUrl: imageUrl,
            weight: ''),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void updateQuantity(String id, int quantity) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingItem) => CartItem(
            id: existingItem.id,
            name: existingItem.name,
            price: existingItem.price,
            quantity: quantity,
            imageUrl: existingItem.imageUrl,
            weight: existingItem.weight),
      );
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
