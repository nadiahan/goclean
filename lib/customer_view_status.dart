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
  List productList = [];


  getAllProduct() async {
    var response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        productList = json.decode(response.body);
      });
      print(productList);
      return productList;
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
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
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children: [
                      new Align(alignment: Alignment.center,
                          child:
                          new Text("Order Tracker",
                            style: TextStyle(fontSize: 32),)
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(70, 30, 60, 0),
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT6Yc_N3xC9akfMD4yRs9kwCBKoaRrie9z-Rg&usqp=CAU",
                          height: 150,
                        ),
                      ),

                      /*Text(
                        "Result : ",
                        style: TextStyle(fontSize: 25),
                      ),*/


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35.0),
                            child: Text(
                              "ID Number: ",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderSide: BorderSide.none),
                                      hintText: "e.g #123456",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                GestureDetector(
                                  onTap:(){
                                    setState(() {
                                      result=true;
                                    });
                                  },
                                  child: Icon(
                                    Icons.search,
                                    size: 35,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          result? Padding(
                            padding: const EdgeInsets.fromLTRB(35, 2, 31, 0),
                            child: Row(
                              children: [
                                Text(
                                  "Result : ",
                                  style: TextStyle(fontSize: 25),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      result=true;
                                    });
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: 25,
                                  ),
                                )
                              ],
                            ),
                          )
                              :SizedBox(),
                          SizedBox(
                            height: 5,
                          ),
                          result? Padding(
                            padding: const EdgeInsets.fromLTRB(15, 2, 15, 0),
                            child:
                            ListView.builder(
                                itemCount: productList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Text(productList[index]['orderStatus']),
                                    title: Text(productList[index]['statusTime']),
                                  );
                                }),
                          )
                              : Transform(
                            transform: Matrix4.translationValues(0, -50, 0),
                            child: Lottie.network(
                                "https://assets2.lottiefiles.com/packages/lf20_t24tpvcu.json"
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
              ),
            ),
            ),
          ],
        ),
      ),
      );
  }

}