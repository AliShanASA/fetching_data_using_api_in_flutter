import 'dart:convert';

import '../Model/user.dart';
import '../Model/user_name.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUser() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final user = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);

      return User(
        cell: e['cell'],
        nat: e['nat'],
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        name: name,
      );
    }).toList();
    return user;
  }
}
