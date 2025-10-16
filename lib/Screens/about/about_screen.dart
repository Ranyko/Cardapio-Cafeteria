import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o App'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            
            Text(
              'Objetivo do Aplicativo',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Este aplicativo foi desenvolvido como um projeto prático em Flutter para a disciplina de Programação para Dispositivos Móveis. O "Peça-Fácil Café" simula um sistema de pedidos para uma cafeteria, permitindo ao usuário navegar pelo cardápio, adicionar itens a um carrinho e simular a finalização de um pedido.',
              style: TextStyle(fontSize: 16, color: Colors.white),
              
            ),
            
            SizedBox(height: 24), 

            
            Text(
              'Equipe de Desenvolvimento',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '• Raniery Chiarelli Barbosa \n• Gabriel Vaz Guerra', 
              style: TextStyle(fontSize: 16,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
