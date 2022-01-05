import 'dart:convert';

List<User> userFromMap(String str) => List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

String userToMap(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class User {
  User({
    required this.id,
    required this.name,
    required this.phonenum,
    required this.address,
    required this.email,
    required this.password,
    required this.role,
  });

  String id;
  String name;
  String phonenum;
  String address;
  String email;
  String password;
  String role;

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phonenum: json["phonenum"],
    address: json["address"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "phonenum": phonenum,
    "address": address,
    "email": email,
    "password": password,
    "role": role,
  };
}
