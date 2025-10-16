import 'package:flutter/material.dart';
import '../models/cafe_item.dart';
import 'dart:math';

class CartProvider extends ChangeNotifier {
  
  final List<CafeItem> _items = [];
  final List<Order>    _orders = [];

  
  List<CafeItem> get items => _items;
  List<Order> get orders =>   _orders;

  
  double get totalPrice {
    double total = 0.0;
    for (var item in _items) {
      total += item.price;
    }
    return total;
  }

  
  void addItem(CafeItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(CafeItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
  
 
  void placeOrder() {
    
    final newOrder = Order(
      id: Random().nextDouble().toString(), 
      total: totalPrice,
      items: List.of(_items), 
      date: DateTime.now(),
    );
    
    _orders.insert(0, newOrder);
    
    
    clearCart();
    
   
  }
}
