import 'dart:convert';
import 'laundrette.dart';
import 'package:http/http.dart' as http;

class LaundretteController {

  static const VIEW_URL = 'http://goclean5yeoja.com/view_laundrette.php';
  static const UPDATE_URL = 'http://goclean5yeoja.com/update_laundrette.php';

  List <Laundrette> laundretteFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<Laundrette>.from(data.map((item)=>Laundrette.fromJson(item)));
  }

  Future<List<Laundrette>> getLaundrette() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      List<Laundrette> launlist = laundretteFromJson(response.body);
      return launlist;
    }
    else {
      return <Laundrette>[];
    }
  }

  Future<String> updateLaundrette(Laundrette laundrette) async{
    final response = await http.post(Uri.parse(UPDATE_URL),body: laundrette.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Add response : " + response.body);
      return response.body;
    }
    else {
      return "Error";
    }
  }


}