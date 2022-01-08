
import 'custMain.dart';
import 'customer_order_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class OrderDetails2 extends StatefulWidget {
  const OrderDetails2({ Key? key}) : super(key: key);

  @override
  _OrderDetails2State createState() => _OrderDetails2State();
}

class _OrderDetails2State extends State<OrderDetails2>{

  bool clothes = false;
  bool shoes = false;
  bool blankets = false;
  bool pillow = false;
  bool rugs = false;
  bool sofacovers = false;
  bool bedsheets = false;
  bool stuffedanimals = false;
  bool comforters = false;
  bool carpet = false;
  bool towels = false;
  bool curtain = false;
  bool others = false;
  bool visible = false ;
  String? serviceName;
  String? newAddress;
  String? orderDate;
  String? orderTime;
  String? cleanName;
  String? emailValue;
  String? orderID;
  String? id;

  late List<String> materialName = [];
  var othersController = new TextEditingController();

  void userSubmit() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller


    var url = 'http://goclean5yeoja.com/insertBooking.php';

    var data = {'id':id, 'orderDate':orderDate, 'orderTime':orderTime, 'cleanName':cleanName, 'serviceName':serviceName, 'newAddress':newAddress, 'materialName':materialName};
    // Starting Web API Call.
    var response = await http.post(Uri.parse(url),body:json.encode(data));
    // Getting Server response into variable.
    var message = jsonDecode(response.body);
    // If Web call Success than Hide the CircularProgressIndicator.


    showDialog(
      context:context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override

  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: new ListView(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 320, 0),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pop(context, MaterialPageRoute(builder: (context)=> CustomerOrderPage()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blue.withOpacity(0.1),
                  ),
                ),
                label: Text(
                  '',
                  style: Theme.of(context).textTheme.headline6,
                ),
                icon: Icon(Icons.chevron_left),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(14, 10, 20, 20),
              child: Text('ORDER',
                style: TextStyle(
                  fontSize: 29,
                  color: Colors.lightBlue[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(14, 5, 20, 0),
              child: Text(
                "ORDER DETAILS",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.lightBlue[500],
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 8, 0),
              child: new Text(
                "Items to be washed:",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.lightBlue[500],
                ),
              ),
            ),

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CheckboxListTile(
                    value: clothes,
                    onChanged: (val){
                      setState(() {
                        clothes=val!;
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Clothes"),
                    subtitle: Text("RM 5.00"),
                  ),
                  CheckboxListTile(
                    value: shoes,
                    onChanged: (val){
                      setState(() {
                        shoes=val!;
                        materialName.add('shoes');
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Shoes"),
                    subtitle: Text("RM 6.00"),
                  ),
                  CheckboxListTile(
                    value: blankets,
                    onChanged: (val){
                      setState(() {
                        blankets=val!;
                        materialName.add('blankets');
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Blankets"),
                    subtitle: Text("RM 10.00"),
                  ),
                  CheckboxListTile(
                    value: pillow,
                    onChanged: (val){
                      setState(() {
                        pillow=val!;
                        materialName.add('pillow');
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Pillow"),
                    subtitle: Text("RM 8.00"),
                  ),
                  CheckboxListTile(
                    value: rugs,
                    onChanged: (val){
                      setState(() {
                        rugs=val!;
                        materialName.add('rugs');
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Rugs"),
                    subtitle: Text("RM 8.00"),
                  ),
                  CheckboxListTile(
                    value: sofacovers,
                    onChanged: (val){
                      setState(() {
                        sofacovers=val!;
                        materialName.add('sofacovers');
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Sofa covers"),
                    subtitle: Text("RM 15.00"),
                  ),
                  CheckboxListTile(
                    value: bedsheets,
                    onChanged: (val){
                      setState(() {
                        bedsheets=val!;
                        materialName.add('bedsheets');
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Bedsheets"),
                    subtitle: Text("RM 12.00"),
                  ),
                  CheckboxListTile(
                    value: stuffedanimals,
                    onChanged: (val){
                      setState(() {
                        stuffedanimals=val!;
                        materialName.add('stuffedanimals');
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Stuffed animals"),
                    subtitle: Text("RM 8.00"),
                  ),
                  CheckboxListTile(
                    value: comforters,
                    onChanged: (val){
                      setState(() {
                        comforters=val!;
                        materialName.add('comforters');
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Comforters"),
                    subtitle: Text("RM 10.00"),
                  ),
                  CheckboxListTile(
                    value: carpet,
                    onChanged: (val){
                      setState(() {
                        carpet=val!;
                        materialName.add('carpet');
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Carpet"),
                    subtitle: Text("RM 35.00"),
                  ),
                  CheckboxListTile(
                    value: towels,
                    onChanged: (val){
                      setState(() {
                        towels=val!;
                        materialName.add('towels');
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Towels"),
                    subtitle: Text("RM 9.00"),
                  ),
                  CheckboxListTile(
                    value: curtain,
                    onChanged: (val){
                      setState(() {
                        curtain=val!;
                        materialName.add('curtains');
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Curtain"),
                    subtitle: Text("RM 10.00"),
                  ),

                  CheckboxListTile(
                    value: others,
                    onChanged: (val){
                      setState(() {
                        others=val!;
                        materialName.add(othersController.text);
                      });
                    },
                    activeColor: Colors.lightBlueAccent,
                    title: Text("Others"),
                  ),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 8),
                    child: new TextField(
                      controller: othersController,
                      decoration: InputDecoration(
                        hintText: "Tablecloth, apron, etc,...",
                        labelText: "State the other items",
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 70, 8, 0),
                    child: new Text(
                      "ANY FRAUD WILL BE CONSIDERED A CRIMINAL OFFENCE."
                          " IF FOUND GUILTY, LEGAL ACTION WILL BE TAKEN.",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(250, 10, 20, 10),
                    child: RaisedButton(
                      onPressed: (){
                        userSubmit();
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> CMenuPage()));
                      },
                      child: Text('Submit'),
                      textColor: Colors.white,
                      color: Colors.lightBlue,
                      focusColor: Colors.blue,
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  void getAttributes() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();

    id = pref.getString('id');
    orderDate = pref.getString('orderDate');
    orderTime = pref.getString('orderTime');
    cleanName = pref.getString('cleanName');
    serviceName = pref.getString('serviceName');
    newAddress = pref.getString('newAddress');
  }
}