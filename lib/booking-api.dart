import 'booking.dart';
import 'package:http/http.dart' as http;

Future<List<Booking>> fetchBookings() async{
  String url ="http://goclean5yeoja.com/booking.php";
  final response = await http.get(Uri.parse(url));
  return bookingFromMap(response.body);
}