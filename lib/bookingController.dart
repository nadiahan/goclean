import 'dart:convert';
import 'booking.dart';
import 'package:http/http.dart' as http;

class BookingController {

  static const VIEW_URL = 'http://goclean5yeoja.com/view_order_history.php';


  List <Booking> bookingFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<Booking>.from(data.map((item)=>Booking.fromJson(item)));
  }

  Future<List<Booking>> getBookingHistory() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      List<Booking> booklist = bookingFromJson(response.body);
      return booklist;
    }
    else {
      return <Booking>[];
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