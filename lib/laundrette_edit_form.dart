import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:get/get.dart';
import 'view_laundrette.dart';
import 'package:goclean/laundrette-api.dart';
//import 'laundrette.dart';
import 'package:http/http.dart' as http;
import 'laundretteController.dart';
import 'view_laundrette.dart';


class LaundretteForm extends StatefulWidget {
  //const LaundretteForm({Key? key}) : super(key: key);
  final List laund;
  final int index;
  LaundretteForm({required this.laund,required this.index});

  @override
  _LaundretteFormState createState() => _LaundretteFormState();
}

class _LaundretteFormState extends State<LaundretteForm> {

  final _formKey = GlobalKey<FormState>();
  late String txtname, txtemail, txtphone, txtaddress, txtbusday, txtbushour;

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phonenum = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController busday = new TextEditingController();
  TextEditingController bushour = new TextEditingController();

  update(){
    var url = 'http://goclean5yeoja.com/update_laundrette.php';
    http.post(Uri.parse(url), body: {
      'launID' :  widget.laund[widget.index]['launID'],
      'name' : name.text,
      'email' : email.text,
      'phonenum' : phonenum.text,
      'address' : address.text,
      'busday' : busday.text,
      'bushour' : bushour.text,
    });
    Fluttertoast.showToast(
        msg: "Update Successful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity:ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      name.text =  widget.laund[widget.index]['name'];
      email.text = widget.laund[widget.index]['email'];
      phonenum.text = widget.laund[widget.index]['phonenum'];
      address.text = widget.laund[widget.index]['address'];
      busday.text = widget.laund[widget.index]['busday'];
      bushour.text = widget.laund[widget.index]['bushour'];
    }
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LaundrettePage()));
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.blue[500],
                      ),
                    ),
                    SizedBox(width: 26),
                    Text(
                      "Edit Laundrette",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.blue[500],
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),

                Center(
                  child:Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height:500,
                      width: 350,
                      padding: EdgeInsets.all(10),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child:Column(
                            children: <Widget>[
                              TextFormField(
                                controller: name,
                                decoration: InputDecoration(labelText:'Name'),
                                keyboardType: TextInputType.text,
                                onSaved: (value){
                                  txtname = value!;
                                },
                                validator: validateName,
                              ),
                              TextFormField(
                                controller: email,
                                decoration: InputDecoration(labelText: 'Email'),
                                keyboardType: TextInputType.text,
                                onSaved: (value){
                                  txtemail = value!;
                                },
                                validator: validateEmail,
                              ),
                              TextFormField(
                                controller: phonenum,
                                decoration: InputDecoration(labelText: 'Phone Number'),
                                keyboardType: TextInputType.text,
                                onSaved: (value){
                                  txtphone = value!;
                                },
                                validator: validatePhone,
                              ),
                              TextFormField(
                                controller: address,
                                decoration: InputDecoration(labelText: 'Address'),
                                keyboardType: TextInputType.text,
                                onSaved: (value){
                                  txtaddress = value!;
                                },
                                validator: validateAddress,
                              ),
                              TextFormField(
                                controller: busday,
                                decoration: InputDecoration(labelText: 'Business Day'),
                                keyboardType: TextInputType.text,
                                onSaved: (value){
                                  txtbusday = value!;
                                },
                                validator: validateBusDay,
                              ),
                              TextFormField(
                                controller: bushour,
                                decoration: InputDecoration(labelText: 'Business Hour'),
                                keyboardType: TextInputType.text,
                                onSaved: (value){
                                  txtbushour = value!;
                                },
                                validator: validateBusHour,
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
                    padding: const EdgeInsets.only(top: 5, left:24),
                    child: Column (
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                update();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LaundrettePage()));
                              },
                              child: Text (
                                "Save",
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

  String? validateName(String? name) {
    if(name!.isEmpty){
      return "Enter laundry shop's name";
    }
    else{
      return null;
    }
  }

  String? validateEmail(String? email) {
    if(email!.isEmpty){
      return "Enter laundry shop's email";
    }
    else{
      return null;
    }
  }

  String? validatePhone(String? phonenum) {
    if(phonenum!.isEmpty){
      return "Enter laundry shop's phone number";
    }
    else{
      return null;
    }
  }

  String? validateAddress(String? address) {
    if(address!.isEmpty){
      return "Enter laundry shop's address";
    }
    else{
      return null;
    }
  }

  String? validateBusDay(String? busday) {
    if(busday!.isEmpty){
      return "Enter laundry shop's business day";
    }
    else{
      return null;
    }
  }

  String? validateBusHour(String? bushour) {
    if(bushour!.isEmpty){
      return "Enter laundry shop's business hour";
    }
    else{
      return null;
    }
  }

}