import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:goclean/booking.dart';
import 'view_order_list.dart';
import 'update_order_status.dart';
import 'update_price.dart';

class ViewOrder extends StatefulWidget {
  //const ViewOrder({Key? key}) : super(key: key);

  final List orderlist;
  final int index;
  ViewOrder({required this.orderlist, required this.index});

  @override
  _ViewOrderState createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {

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
                            context) => OrderListPage()));
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

                SizedBox(height: 25,),

                //button for update order status
                Container(
                  width: 270,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Container (
                    padding: const EdgeInsets.only(top: 5, left:20),
                    child: Column (
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                    builder: (BuildContext context)=>new UpdateOrder(orderlist: widget.orderlist, index: widget.index),),);
                              },
                              child: Text (
                                "Update Order Status",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                //button for update total price
                Container(
                  width: 270,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Container (
                    padding: const EdgeInsets.only(top: 5, left:35),
                    child: Column (
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (BuildContext context)=>new UpdatePrice(orderlist: widget.orderlist, index: widget.index),),);
                              },
                              child: Text (
                                "Update Total Price",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            //),
          ),
        ],
      ),
    );
  }
}
