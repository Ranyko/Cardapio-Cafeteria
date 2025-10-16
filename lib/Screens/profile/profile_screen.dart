import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../auth/login_screen.dart';
import 'order_history_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil')),
      body: ListView(
  padding: const EdgeInsets.all(24.0),
  children: [
    const Text(
      'Informações da Conta',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 16),
    Text('Nome: ${user?.name ?? ''}', style: const TextStyle(fontSize: 18)),
    const SizedBox(height: 8),
    Text('E-mail: ${user?.email ?? ''}', style: const TextStyle(fontSize: 18)),
    const SizedBox(height: 8),
    Text('Telefone: ${user?.phone ?? ''}', style: const TextStyle(fontSize: 18)),
    const Divider(height: 48, color: Colors.white54),

  
    ListTile(
      leading: const Icon(Icons.history, color: Colors.white),
      title: const Text('Ver Histórico de Pedidos'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const OrderHistoryScreen()),
        );
      },
    ),
    const Divider(color: Colors.white54),

    const SizedBox(height: 32),
    ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () {
        context.read<AuthProvider>().logout();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
      },
      child: const Text('Sair (Logout)'),
    ),
  ],
),
    );
  }
}