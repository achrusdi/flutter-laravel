import 'package:flutter/cupertino.dart';
import 'package:laravel_flutter/models/user.model.dart';
import 'package:laravel_flutter/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {required String name,
      required String username,
      required String email,
      required String password}) async {
    try {
      UserModel user = await AuthService().register(
          name: name, email: email, username: username, password: password);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      UserModel user = await AuthService()
          .login(email: email.toString(), password: password.toString());
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
