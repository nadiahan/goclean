import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'mngrMain.dart';
import 'package:http/http.dart' as http;
import 'view_one_order_history.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {

  static const url = 'http://goclean5yeoja.com/view_order_history.php';
  List orderhist = [];

  Future getOrderHist() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        orderhist = json.decode(response.body);
      });
      //return json.decode(response.body);
      return orderhist;
    }

  }

  @override
  void initState() {
    super.initState();
    getOrderHist();
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
        title: Text('Order History',
          style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w500
          ),
          ),
        backgroundColor: Colors.blue[500],
        /*actions: <Widget> [
        ], */
      ),

      body: FutureBuilder(
          future: getOrderHist(),
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
                        "Order #" + orderhist[index]['orderID'],
                        style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900]),),
                      subtitle: Text(orderhist[index]['orderStatus'],
                        style: TextStyle(fontSize: 16, color:Colors.blueGrey[900]),),
                      trailing: GestureDetector(child: Icon(Icons.arrow_forward_ios, color: Colors.black),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewOneOrder(orderhist: orderhist, index: index,),),);
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