import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:get/get.dart';
import 'main.dart';
import 'mngrMain.dart';
import 'bookingController.dart';
import 'package:goclean/booking.dart';
import 'view_one_order.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {

  static const url = 'http://goclean5yeoja.com/view_order_list.php';
  List orderlist = [];

  Future getOrderlist() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        orderlist = json.decode(response.body);
      });
      //return json.decode(response.body);
      return orderlist;
    }

  }

  @override
  void initState() {
    super.initState();
    getOrderlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton (
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ManagerMenu()));
          },
          icon: Icon(Icons.home_outlined),
        ),
        centerTitle: true,
        title: Text('Order List',
          style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w500
          ),
        ),
        backgroundColor: Colors.blue[500],
      ),

      body: FutureBuilder(
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
                        "Order #" + orderlist[index]['orderID'],
                        style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900]),),
                      subtitle: Text(orderlist[index]['orderDate'] + " / " + orderlist[index]['orderTime'],
                        style: TextStyle(fontSize: 16, color:Colors.blueGrey[900]),),
                      trailing: GestureDetector(child: Icon(Icons.arrow_forward_ios, color: Colors.black),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewOrder(orderlist: orderlist, index: index,),),);
                        },),
                    ),
                  );
                }
            ) : CircularProgressIndicator();
          }

      ),

    );
  }
}
