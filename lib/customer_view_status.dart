import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vertical_stepper/vertical_stepper.dart';
import 'package:vertical_stepper/vertical_stepper.dart' as step;
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:goclean/booking-api.dart';
import 'booking.dart';
import 'package:goclean/user-api.dart';
import 'user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerViewStatus extends StatefulWidget{
  @override
  _CustomerViewStatusState createState() => _CustomerViewStatusState();
}

class _CustomerViewStatusState extends State<CustomerViewStatus> with TickerProviderStateMixin{

  String? emailValue;
  bool result = false;
  static const url = 'http://goclean5yeoja.com/cust_view_status.php';
  List orderlist = [];

  Future getOrderlist() async{
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        orderlist = json.decode(response.body);
      });
      //return json.decode(response.body);
      return orderlist;
    }
  }

  List<step.Step>steps = [
    step.Step(
      shimmer: false,
      title:"Order placed",
      iconStyle: Colors.green,
      content: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2021/5/20 11:35 AM Order Confirmed"),
        ),
      ),
    ),
    step.Step(
      shimmer: false,
      title:
      "Pending for pickup/deliver",
      iconStyle: Colors.green,
      content: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2021/5/20 11:35 AM Order Created"),
        ),
      ),
    ),

    step.Step(
      shimmer: false,
      title:"In the machine",
      iconStyle: Colors.green,
      content: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2021/5/20 11:35 AM Order Created"),
        ),
      ),
    ),

    step.Step(
      shimmer: false,
      title:"Pickup/Delivering",
      iconStyle: Colors.green,
      content: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2021/5/20 11:35 AM Order Created"),
        ),
      ),
    ),

    step.Step(
      shimmer: false,
      title:"Pickuped/Delivered",
      iconStyle: Colors.green,
      content: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2021/5/20 11:35 AM Order Created"),
        ),
      ),
    ),

    step.Step(
      shimmer: false,
      title:"Complete",
      iconStyle: Colors.green,
      content: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2021/5/20 11:35 AM Order Complete"),
        ),
      ),
    ),
  ];



  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: content(),
    );
  }

  Widget content(){
    return Column(
      children: [
        Container(
          height: 230,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT6Yc_N3xC9akfMD4yRs9kwCBKoaRrie9z-Rg&usqp=CAU",
                    height: 150,
                  ),
                  Text(
                    "Order Tracker",
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            ),
          ),
        ),
        body()
      ],
    );
  }

  Widget body(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SizedBox(
      height: 50,
    ),


    SizedBox(
    height: 20,
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(35, 2, 31, 0),
    child: Row(
    children: [
    Text(
    "Result : ",
    style: TextStyle(fontSize: 25),
    ),
    Spacer(),
    ],
    ),
    ),

    SizedBox(
    height: 5,
    ),
        FutureBuilder(
            future: getOrderlist(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey[200],
                      margin: EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 30.0, right: 20.0),
                        title: Text(
                          "Order #" + orderlist[index]['id'],
                          style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[900]),),
                        subtitle: Text(orderlist[index]['orderStatus'],
                          style: TextStyle(fontSize: 16, color:Colors.blueGrey[900]),),
                        trailing: GestureDetector(child: Icon(Icons.arrow_forward_ios, color: Colors.black),
                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => ViewOrder(orderlist: orderlist, index: index,),),);
                          },),
                      ),
                    );
                  }
              ) : CircularProgressIndicator();
            }

        ),


      ],
    );
  }}