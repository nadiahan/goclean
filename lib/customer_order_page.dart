import 'package:shared_preferences/shared_preferences.dart';

import 'custMain.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:goclean/user-api.dart';
import 'user.dart';
import 'package:flutter_session/flutter_session.dart';


class CustomerOrderPage extends StatefulWidget {
  const CustomerOrderPage({ Key? key }) : super(key: key);

  _CustomerOrderPageState createState() => _CustomerOrderPageState();
}

class _CustomerOrderPageState extends State<CustomerOrderPage>{

  String? emailValue;

  String serviceName = '';
  var serviceController = new TextEditingController();
  late String newAddress;
  var addressController = new TextEditingController();
  String cleanName = '';
  var cleanNameController = new TextEditingController();
  String orderDate='';
  String orderTime='';
  var orderDateController = new TextEditingController();
  var orderTimeController = new TextEditingController();
  bool visible = false ;
  String id = '';
  var idController = new TextEditingController();
  String orderID = '';

  void userSubmit() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    id = idController.text;
    orderID = idController.text;
    serviceName = serviceController.text;
    orderDate = orderDateController.text;
    orderTime = orderTimeController.text;
    cleanName = cleanNameController.text;
    newAddress = addressController.text;

    var url = 'http://goclean5yeoja.com/insertBooking.php';

    var data = {'id':id, 'orderDate':orderDate, 'orderTime':orderTime, 'cleanName':cleanName, 'serviceName':serviceName, 'newAddress':newAddress};
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
    return Scaffold(
      body: SafeArea(
        child: new ListView(
          children: [
            FutureBuilder(
              future: fetchUsers(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        User user = snapshot.data![index];
                        getEmail();
                        if(user.email == emailValue)
                        {
                          id = user.id;
                          idController = new TextEditingController(text: id);
                        }
                        return Text("Next", style: TextStyle(fontSize:1, color:Colors.white));}
                  );
                }return CircularProgressIndicator();
              },
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(14, 30, 20, 20),
              child: Text('ORDER',
                style: TextStyle(
                  fontSize: 29,
                  color: Colors.lightBlue[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(14, 5, 20, 20),
              child: Text(
                "SERVICE DETAILS",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.lightBlue[500],
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            new Text(
              "   Service method",
              style: TextStyle(
                fontSize: 18,
                color: Colors.lightBlue[500],
              ),
            ),

            Container(
              padding: new EdgeInsets.all(10.0),
              child: Column(
                children: [
                  new Row(
                    children: <Widget>[
                      new Radio(
                        value: 'PICKUP',
                        groupValue: serviceName,
                        onChanged: (val){
                          serviceName = val.toString();
                          setState(() {
                            serviceController = new TextEditingController(text: serviceName);
                          });
                        },
                      ),
                      Text(
                        'PICKUP',
                        style: TextStyle(fontSize: 13),
                      ),

                      new Radio(
                        value: 'DELIVERY',
                        groupValue: serviceName,
                        onChanged: (val){
                          serviceName = val.toString();
                          setState(() {
                            serviceController = new TextEditingController(text: serviceName);
                          });
                        },
                      ),
                      Text(
                        'DELIVERY',
                        style: TextStyle(fontSize: 13),
                      ),

                      new Radio(
                        value: 'BOTH',
                        groupValue: serviceName,
                        onChanged: (val){
                          serviceName = val.toString();
                          setState(() {
                            serviceController = new TextEditingController(text: serviceName);
                          });
                        },
                      ),
                      Text(
                        'BOTH',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: new Text(
                "Date and time:",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.lightBlue[500],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
              child: new TextField(
                controller: orderDateController,
                decoration: InputDecoration(
                  hintText: "YYYY/MM/DD",
                  labelText: "Date",
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                  border: UnderlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
              child: new TextField(
                controller: orderTimeController,
                decoration: InputDecoration(
                  hintText: "HH:MM",
                  labelText: "Time",
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                  border: UnderlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    new Row(
                      children: <Widget>[
                        new Radio(
                          value: 'WASH ONLY',
                          groupValue: cleanName,
                          onChanged: (val){
                            cleanName = val.toString();
                            setState(() {
                              cleanNameController = new TextEditingController(text: cleanName);
                            });
                          },
                        ),
                        Text(
                          'WASH ONLY',
                          style: TextStyle(fontSize: 10),
                        ),

                        new Radio(
                          value: 'WASH AND DRY',
                          groupValue: cleanName,
                          onChanged: (val){
                            cleanName = val.toString();
                            setState(() {
                              cleanNameController = new TextEditingController(text: cleanName);
                            });
                          },
                        ),
                        Text(
                          'WASH AND DRY',
                          style: TextStyle(fontSize: 10),
                        ),

                        new Radio(
                          value: 'WASH, DRY AND FOLD',
                          groupValue: cleanName,
                          onChanged: (val){
                            cleanName = val.toString();
                            setState(() {
                              cleanNameController = new TextEditingController(text: cleanName);
                            });
                          },
                        ),
                        Text(
                          'WASH, DRY AND FOLD',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),


            Container(
              padding: new EdgeInsets.all(10.0),
              child: new Column(
                children: <Widget>[

                  new Padding(padding: new EdgeInsets.only(top: 5.0),),
                  new TextFormField(
                    maxLines: 3,
                    controller: addressController,
                    decoration: new InputDecoration(
                      hintText: "Your delivery/pickup address...",
                      labelText: "Address",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10),
                      ),

                    ),
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 20.0),),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
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
  void getEmail() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    emailValue = pref.getString('emailData');
    setState((){

    });
  }

}