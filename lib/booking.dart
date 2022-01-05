//import 'dart:convert';

//List<Booking> bookingFromMap(String str) => List<Booking>.from(json.decode(str).map((x) => Booking.fromMap(x)));

//String bookingToMap(List<Booking> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Booking {
  String orderID;
  String orderDate;
  String orderTime;
  String orderStatus;
  String id;
  String serviceName;
  String cleanName;
  String materialName;
  String totalPrice;

  Booking({
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

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      orderID: json["orderID"] as String,
      orderDate: json["orderDate"] as String,
      orderTime: json["orderTime"] as String,
      orderStatus: json["orderStatus"] as String,
      id: json["id"] as String,
      serviceName: json["serviceName"] as String,
      cleanName: json["cleanName"] as String,
      materialName: json["materialName"] as String,
      totalPrice: json["totalPrice"] as String,
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