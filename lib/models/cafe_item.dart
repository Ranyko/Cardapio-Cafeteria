import 'package:flutter/widgets.dart';

class CafeItem {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final Alignment imageAlignment;


  CafeItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.imageAlignment = Alignment.center,
  });
}

class Order {
  final String id;
  final double total;
  final List<CafeItem> items;
  final DateTime date;

  Order({
    required this.id,
    required this.total,
    required this.items,
    required this.date,
  });
}