import 'dart:convert';

import 'package:laravel_flutter/global_variable.dart';
import 'package:laravel_flutter/models/user.model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = globalBaseUrl;
  Future<UserModel> register({
    required String name,
    required String email,
    required String username,
    required String password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);

      // user.token = data['']
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      throw Exception('Failed to register');
    }
  }

  // Login
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      data['user']['token'] = 'Bearer ' + data['access_token'];
      UserModel user = UserModel.fromJson(data['user']);

      // user.token = data['']
      // user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      throw Exception('Failed to login in service');
    }
  }
}
