import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Carrinho'),
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                'Seu carrinho está vazio!',
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
            )
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.imageUrl),
                    ),
                    title: Text(item.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('R\$ ${item.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline,
                          color: Colors.red),
                      onPressed: () {
                        context.read<CartProvider>().removeItem(item);
                      },
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.items.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: R\$ ${cart.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Confirmar Pedido'),
                          content: Text(
                              'Deseja confirmar seu pedido no valor de R\$ ${cart.totalPrice.toStringAsFixed(2)}?'),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.deepPurple
                                  ),
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.deepPurple
                                  ),
                              child: const Text('Confirmar'),
                              onPressed: () {
                                context.read<CartProvider>().placeOrder();
                                Navigator.of(ctx).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Finalizar Pedido'),
                  ),
                ],
              ),
            ),
    );
  }
}