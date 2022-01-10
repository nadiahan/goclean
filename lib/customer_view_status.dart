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
import 'cust_view_list.dart';
import 'user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'customer_order_page.dart';

class CustomerViewStatus extends StatefulWidget{

  final List orderlist;
  final int index;
  CustomerViewStatus({required this.orderlist, required this.index});
  @override
  _CustomerViewStatusState createState() => _CustomerViewStatusState();
}

class _CustomerViewStatusState extends State<CustomerViewStatus> with TickerProviderStateMixin {

  String? emailValue;
  static const url = 'http://goclean5yeoja.com/cust_view_status.php';
  var idController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Order #${widget.booking.orderID}",
          style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w500
          ),
        ),
        backgroundColor: Colors.blue[500],
        /*actions: <Widget> [
        ], */
      ),*/
      body: Stack(
        children: <Widget>[
          SingleChildScrollView (
            //Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => CustomerViewList()));
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.blue[500],
                      ),
                    ),
                    SizedBox(width: 80,),
                    Text(
                      "Order #" +  widget.orderlist[widget.index]['orderID'],
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.blue[500],
                          fontWeight: FontWeight.w700
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 1,
                  color: Colors.grey,
                ),

                Center (
                  child: Text(
                    widget.orderlist[widget.index]['orderStatus'],
                    style: TextStyle(
                        fontSize: 28, color: Colors.green),
                  ),
                ),
                Center (
                  child: Text(
                    widget.orderlist[widget.index]['statusTime'],
                    style: TextStyle(
                        fontSize: 20, color: Colors.black26),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(height: 5,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Order Date : " +  widget.orderlist[widget.index]['orderDate'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Order Time : " +  widget.orderlist[widget.index]['orderTime'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Customer Name : " +  widget.orderlist[widget.index]['name'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Address : " +  widget.orderlist[widget.index]['address'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Phone No. : " +  widget.orderlist[widget.index]['phonenum'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "New Address : " +  widget.orderlist[widget.index]['newAddress'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Service Details : " +  widget.orderlist[widget.index]['serviceName'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cleaning Type : " +  widget.orderlist[widget.index]['cleanName'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Materials : " +  widget.orderlist[widget.index]['materialName'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Total Price : RM " +  widget.orderlist[widget.index]['totalPrice'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),

                //button for update total price


              ],
            ),
            //),
          ),
        ],
      ),
    );
  }
}
