import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'mngrMain.dart';
import 'package:http/http.dart' as http;
import 'view_order_history.dart';


class ViewOneOrder extends StatefulWidget {
  //const ViewOneOrder({Key? key}) : super(key: key);

  final List orderhist;
  final int index;
  ViewOneOrder({required this.orderhist, required this.index});


  @override
  _ViewOneOrderState createState() => _ViewOneOrderState();
}

class _ViewOneOrderState extends State<ViewOneOrder> {

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
                            context) => OrderHistoryPage()));
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.blue[500],
                      ),
                    ),
                    SizedBox(width: 80,),
                    Text(
                      "Order #" +  widget.orderhist[widget.index]['orderID'],
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
                    widget.orderhist[widget.index]['orderStatus'],
                    style: TextStyle(
                        fontSize: 26, color: Colors.green),
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
                    "Order Date : " +  widget.orderhist[widget.index]['orderDate'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Order Time : " +  widget.orderhist[widget.index]['orderTime'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Customer Name : " +  widget.orderhist[widget.index]['name'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Address : " +  widget.orderhist[widget.index]['address'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Phone No. : " +  widget.orderhist[widget.index]['phonenum'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "New Address : " +  widget.orderhist[widget.index]['newAddress'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Service Details : " +  widget.orderhist[widget.index]['serviceName'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cleaning Type : " +  widget.orderhist[widget.index]['cleanName'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Materials : " +  widget.orderhist[widget.index]['materialName'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Total Price : RM " +  widget.orderhist[widget.index]['totalPrice'],
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueGrey[900]),
                  ),),

                SizedBox(height: 25,),

              ],
            ),
            //),
          ),
        ],
      ),
    );
  }
}