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
import 'custMain.dart';
import 'customer_view_status.dart';
import 'user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'customer_order_page.dart';

class CustomerViewList extends StatefulWidget{

  @override
  _CustomerViewListState createState() => _CustomerViewListState();
}

class _CustomerViewListState extends State<CustomerViewList> with TickerProviderStateMixin {

  static const url = 'http://goclean5yeoja.com/cust_order_list.php';
  List orderlist = [];
  String? emailValue;
  String id = '';
  var idController = new TextEditingController();

  Future getOrderlist() async {
    var response = await http.post(Uri.parse(url),body:{"id":idController.text});
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CMenuPage()));
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

      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
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
          ),
          Expanded(
            child: FutureBuilder(
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerViewStatus(orderlist: orderlist, index: index,),),);
                              },),
                          ),
                        );
                      }
                  ) : CircularProgressIndicator();
                }

            ),
          ),

        ],
      ),


    );
  }

  void getEmail() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    emailValue = pref.getString('emailData');
    setState((){});
  }

}
