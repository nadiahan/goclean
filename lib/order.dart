//import 'dart:convert';

//List<Laundrette> laundretteFromMap(String str) => List<Laundrette>.from(json.decode(str).map((x) => Laundrette.fromMap(x)));

//String laundretteToMap(List<Laundrette> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Order {
  int orderID;
  String orderDate;
  String orderTime;
  String orderStatus;
  int id;
  String serviceName;
  String cleanName;
  String materialName;
  int totalPrice;

  Order({
    required this.orderID,
    required this.orderDate,
    required this.orderTime,
    required this.orderStatus,
    required this.id,
    required this.serviceName,
    required this.cleanName,
    required this.materialName,
    required this.totalPrice,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderID: json["orderID"] as int,
      orderDate: json["orderDate"] as String,
      orderTime: json["orderTime"] as String,
      orderStatus: json["orderStatus"] as String,
      id: json["id"] as int,
      serviceName: json["serviceName"] as String,
      cleanName: json["cleanName"] as String,
      materialName: json["materialName"] as String,
      totalPrice: json["totalPrice"] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    "orderID": orderID,
    "orderDate": orderDate,
    "orderTime": orderTime,
    "orderStatus": orderStatus,
    "id": id,
    "serviceName": serviceName,
    "cleanName": cleanName,
    "materialName": materialName,
    "totalPrice": totalPrice,
  };

  Map<String, dynamic> toJsonUpdate() => {
    "orderID": orderID,
    "orderDate": orderDate,
    "orderTime": orderTime,
    "orderStatus": orderStatus,
    "id": id,
    "serviceName": serviceName,
    "cleanName": cleanName,
    "materialName": materialName,
    "totalPrice": totalPrice,
  };
}