import 'package:flutter/material.dart';
import '../../models/cafe_item.dart';
import '../../providers/cart_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class ItemDetailsScreen extends StatelessWidget{
  final CafeItem item;
  
  const ItemDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text(item.name),
  ),
  body: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      
      
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 100, 58, 173), width: 4), 
        ),
        child: Image.network(
          item.imageUrl,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),

    
      Card(
        margin: const EdgeInsets.all(12.0), 
        elevation: 0, 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(221, 255, 255, 255),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                item.description,
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 197, 173, 197),
                ),
              ),
              
              const SizedBox(height: 16),

              Text(
                'R\$ ${item.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 172, 154, 204), 
                ),
              ),

            ],
          ),
        ),
      ),

    ],
  ),

      
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 179, 117, 230),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            
            final cart = context.read<CartProvider>();

  
  cart.addItem(item);

  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${item.name} foi adicionado ao carrinho!'),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green[700],
      behavior: SnackBarBehavior.floating,
    ),
  );

  
  Navigator.of(context).pop();
          },
          child: const Text('Adicionar ao Carrinho'),
        ),
      ), 
    ); 
  }



}