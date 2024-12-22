import 'package:flutter/material.dart';
import 'storage_service.dart';

class AuthProvider extends ChangeNotifier {
  final _storageService = StorageService();
  final String _hardcodedUsername = 'admin';
  final String _hardcodedPassword = '1234';
  String? loggedInUsername;

  bool login(String username, String password) {
    if (username == _hardcodedUsername && password == _hardcodedPassword) {
      loggedInUsername = username;
      _storageService.saveUsername(username);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> checkLoginStatus() async {
    loggedInUsername = await _storageService.getUsername();
    notifyListeners();
  }

  void logout() {
    loggedInUsername = null;
    _storageService.clearUsername();
    notifyListeners();
  }
}
