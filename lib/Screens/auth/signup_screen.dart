import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../menu/menu_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _passwordController = TextEditingController();

  final _phoneMask = MaskTextInputFormatter(mask: '(##) #####-####');
  final _birthdayMask = MaskTextInputFormatter(mask: '##/##/####');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Conta')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                TextFormField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(labelText: 'Nome Completo'),
                  validator: (value) => value!.trim().isEmpty ? 'Preencha seu nome.' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: (value) => !value!.contains('@') ? 'Insira um e-mail válido.' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [_phoneMask],
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(labelText: 'Telefone'),
                  validator: (value) => value!.length < 15 ? 'Preencha o telefone.' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _birthdayController,
                  keyboardType: TextInputType.datetime,
                  inputFormatters: [_birthdayMask],
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(labelText: 'Data de Nascimento'),
                  validator: (value) => value!.length < 10 ? 'Preencha a data.' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(labelText: 'Senha'),
                  validator: (value) => value!.length < 6 ? 'A senha precisa de 6+ caracteres.' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(labelText: 'Confirmar Senha'),
                  validator: (value) => value != _passwordController.text ? 'As senhas não coincidem.' : null,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final authProvider = context.read<AuthProvider>();
                      final success = await authProvider.signUp(
                        name: _nameController.text,
                        email: _emailController.text,
                        phone: _phoneController.text,
                        password: _passwordController.text,
                        birthday: _birthdayController.text,
                      );
                      if (success && mounted) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const MenuScreen()),
                        );
                      } else if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Este e-mail já está em uso.'),
                              backgroundColor: Colors.red),
                        );
                      }
                    }
                  },
                  child: const Text('Cadastrar', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}