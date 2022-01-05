import 'user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async{
  String url ="http://goclean5yeoja.com/user.php";
  final response = await http.get(Uri.parse(url));
  return userFromMap(response.body);
}