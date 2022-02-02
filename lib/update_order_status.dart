import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:goclean/booking.dart';
import 'view_order_list.dart';
import 'view_one_order.dart';


class UpdateOrder extends StatefulWidget {
  //const UpdateOrder({Key? key}) : super(key: key);

  final List orderlist;
  final int index;
  UpdateOrder({required this.orderlist, required this.index});

  @override
  _UpdateOrderState createState() => _UpdateOrderState();
}

class _UpdateOrderState extends State<UpdateOrder> {

  final _formKey = GlobalKey<FormState>();
  late String txtstatus;
  late String txttime;
  TextEditingController status = new TextEditingController();
  TextEditingController time = new TextEditingController();

  updateStatus() {
      var url = 'http://goclean5yeoja.com/update_order_status.php';
      http.post(Uri.parse(url),body: {
        'orderID': widget.orderlist[widget.index]['orderID'],
        'orderStatus': status.text,
        'statusTime': time.text,
      });
      Fluttertoast.showToast(
          msg: "Status Updated!",
          toastLength: Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.white,
          textColor: Colors.red,
          fontSize: 16
      );}

  @override
  void initState() {
    status.text = widget.orderlist[widget.index]['orderStatus'];
    time.text = widget.orderlist[widget.index]['statusTime'];
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
                      "Update Order Status",
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
                                controller: status,
                                decoration: InputDecoration(labelText:'Order Status',
                                ),
                                keyboardType: TextInputType.text,
                                onSaved: (value){
                                  txtstatus = value!;
                                },
                                validator: validateStatus,
                              ),
                              TextFormField(
                                controller: time,
                                decoration: InputDecoration(labelText:'Status Change Time (hh:mm:ss)',
                                ),
                                keyboardType: TextInputType.text,
                                onSaved: (value){
                                  txttime = value!;
                                },
                                validator: validateTime,
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
                                updateStatus();
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

  String? validateStatus(String? status) {
    if(status!.isEmpty){
      return "Do not leave order status empty";
    }
    else{
      return null;
    }
  }

  String? validateTime(String? time) {
    if(time!.isEmpty){
      return "Do not leave order status change time empty";
    }
    else{
      return null;
    }
  }

}
