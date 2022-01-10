import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:goclean/booking.dart';
import 'view_order_list.dart';
import 'view_one_order.dart';

class UpdatePrice extends StatefulWidget {
  //const UpdatePrice({Key? key}) : super(key: key);

  final List orderlist;
  final int index;
  UpdatePrice({required this.orderlist, required this.index});

  @override
  _UpdatePriceState createState() => _UpdatePriceState();
}

class _UpdatePriceState extends State<UpdatePrice> {

  final _formKey = GlobalKey<FormState>();
  late String txttotal;
  TextEditingController total = new TextEditingController();

  updatePrice() {
    var url = 'http://goclean5yeoja.com/update_price.php';
    //int totalP = widget.orderlist[widget.index]['servicePrice'] + widget.orderlist[widget.index]['cleanPrice'] + widget.orderlist[widget.index]['materialPrice'];
    http.post(Uri.parse(url),body: {
      'orderID': widget.orderlist[widget.index]['orderID'],
      'totalPrice': total.text,

    });
    Fluttertoast.showToast(
        msg: "Price Updated!",
        toastLength: Toast.LENGTH_SHORT,
        gravity:ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16
    );}

  @override
  void initState() {
    total.text = widget.orderlist[widget.index]['totalPrice'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
            ),
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 10),
            child:Column(
              children: <Widget>[
                Row(
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context)=>new ViewOrder(orderlist: widget.orderlist, index: widget.index),),);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.blue[500],
                      ),
                    ),
                    SizedBox(width: 26),
                    Text(
                      "Update Total Price",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue[500],
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                SizedBox(height:30,),
                Center(
                  child:Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height:350,
                      width: 350,
                      padding: EdgeInsets.all(10),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child:Column(
                            children: <Widget>[
                              TextFormField(
                                controller: total,
                                decoration: InputDecoration(labelText:'Total Price (RM 00.00)',
                                ),
                                keyboardType: TextInputType.text,
                                onSaved: (value){
                                  txttotal = value!;
                                },
                              ),
                              SizedBox(height:20,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Container (
                    padding: const EdgeInsets.only(top: 5, left:13),
                    child: Column (
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                updatePrice();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderListPage()));
                              },
                              child: Text (
                                "Update",
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
                SizedBox(width: 5,),
              ],
            ),

          ),

        ],
      ),
    );
  }
}