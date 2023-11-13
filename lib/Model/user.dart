import 'package:kamwali/Model/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final String cell;
  final UserName name;

  User({
    required this.nat,
    required this.cell,
    required this.gender,
    required this.email,
    required this.phone,
    required this.name,
  });

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
