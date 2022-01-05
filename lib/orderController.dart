import 'dart:convert';
import 'order.dart';
import 'package:http/http.dart' as http;

class OrderController {

  static const VIEW_URL = 'http://goclean5yeoja.com/view_order_history.php';


  List <Order> orderFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<Order>.from(data.map((item)=>Order.fromJson(item)));
  }

  Future<List<Order>> getOrderHistory() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      List<Order> ordlist = orderFromJson(response.body);
      return ordlist;
    }
    else {
      return <Order>[];
    }
  }

  /*
  Future<String> updateLaundrette(Laundrette laundrette) async{
    final response = await http.post(Uri.parse(UPDATE_URL),body: laundrette.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Add response : " + response.body);
      return response.body;
    }
    else {
      return "Error";
    }
  }*/

}