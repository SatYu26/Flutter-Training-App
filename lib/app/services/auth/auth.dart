import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  var status;
  var errorMessage;
  var nameOfUser;
  var userName;



  Future<void> login(
      String email,
      String password,
      ) async {
    const url = 'https://tapshake.herokuapp.com/v1/auth/login';
    var jsonData;
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'notification_id': '3222',
          'login_method': 1,
        },
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    jsonData = (json.decode(response.body));
    status = jsonData['status'] == 200;
    if (status) {
      _saveToSharedPrefernces(
        jsonData['access_token'],
        jsonData['data']['name'],
        jsonData['data']['username'],
      );
      print(jsonData);
    } else {
      errorMessage = jsonData['msg'];
      print(errorMessage);
    }
  }

  Future<void> signup(
      String fullName,
      String username,
      String email,
      String password,
      ) async {
    const url = 'https://tapshake.herokuapp.com/v1/auth/signup';
    var jsonData;
    final response = await http.post(
      url,
      body: json.encode(
        {
          'name': fullName,
          'username': username,
          'email': email,
          'password': password,
        },
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );
    jsonData = (json.decode(response.body));
    status = jsonData['status'] == 200;
    if (status) {
      _saveToSharedPrefernces(
        jsonData['access_token'],
        jsonData['data']['name'],
        jsonData['data']['username'],
      );

      print(jsonData);
      print('Name is: ' + jsonData['data']['name']);
      print('Name is: ' + jsonData['data']['username']);
    } else {
      errorMessage = jsonData['msg'];
      print(errorMessage);
    }
  }
  _saveToSharedPrefernces(
      dynamic token, String nameOfUser, String userName) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = token;
    prefs.setString(key, value);
    prefs.setString('name', nameOfUser);
    prefs.setString('username', userName);
  }

  readFromSharedPrefernces() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}