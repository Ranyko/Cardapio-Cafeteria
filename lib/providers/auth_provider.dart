import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthProvider extends ChangeNotifier {
  final List<User> _registeredUsers = [];
  User? _currentUser;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;

  Future<bool> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String birthday,
  }) async {
    final userExists = _registeredUsers.any((user) => user.email == email);
    if (userExists) {
      return false; 
    }

    final newUser = User(
      name: name,
      email: email,
      phone: phone,
      password: password,
      birthday: birthday,
    );
    _registeredUsers.add(newUser);
    _currentUser = newUser;
    notifyListeners();
    return true;
  }

  Future<bool> login(String email, String password) async {
    try {
      final user = _registeredUsers.firstWhere(
        (user) => user.email == email && user.password == password,
      );
      _currentUser = user;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}