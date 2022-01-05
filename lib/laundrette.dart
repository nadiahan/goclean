//import 'dart:convert';

//List<Laundrette> laundretteFromMap(String str) => List<Laundrette>.from(json.decode(str).map((x) => Laundrette.fromMap(x)));

//String laundretteToMap(List<Laundrette> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Laundrette {
  String name;
  String email;
  String phonenum;
  String address;
  String busday;
  String bushour;

  Laundrette({
    required this.name,
    required this.email,
    required this.phonenum,
    required this.address,
    required this.busday,
    required this.bushour,
  });

  factory Laundrette.fromJson(Map<String, dynamic> json) {
    return Laundrette(
    name: json["name"] as String,
    email: json["email"] as String,
    phonenum: json["phonenum"] as String,
    address: json["address"] as String,
    busday: json["busday"] as String,
    bushour: json["bushour"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phonenum": phonenum,
    "address": address,
    "busday": busday,
    "bushour": bushour,
  };

  Map<String, dynamic> toJsonUpdate() => {
    "name": name,
    "email": email,
    "phonenum": phonenum,
    "address": address,
    "busday": busday,
    "bushour": bushour,
  };
}