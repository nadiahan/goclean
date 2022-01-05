import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget{
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp>{

  final _formKey = GlobalKey<FormState>();
  late String txtname, txtemail, txtpassword, txtphonenum, txtaddress, txtrole='';

  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;

  // Getting value from TextField widget.
  final nameController = TextEditingController();
  final phonenumController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final roleController = TextEditingController();

  Future userRegister() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String name = nameController.text;
    String phonenum = phonenumController.text;
    String address = addressController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String role = roleController.text;


    var url = 'http://goclean5yeoja.com/register.php';

    var data = {'name':name,'phonenum':phonenum,'address':address, 'email':email,'password':password,'role':role};
    // Starting Web API Call.
    var response = await http.post(Uri.parse(url),body:json.encode(data));
    // Getting Server response into variable.
    var message = jsonDecode(response.body);
    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    showDialog(
      context:context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Go Clean"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
            ),
          ),
          Center(
            child: SingleChildScrollView(
            child:Column(
              children: <Widget>[
                Container(
                  padding:EdgeInsets.only(bottom: 40),
                  child:
            Text("Registration", style: TextStyle(
              fontSize: 30,
              color: Colors.blue[500],
              fontWeight: FontWeight.bold
              ),
            ),
                ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height:410,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key:_formKey,
                  child: SingleChildScrollView(
                    child:Column(
                      children: <Widget>[
                        //email
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(labelText:'Name'),
                          onSaved: (value){
                            txtname = value!;
                          },
                          validator: validateName,
                        ),
                        TextFormField(
                          controller: phonenumController,
                          decoration: InputDecoration(labelText:'Phone number'),
                          onSaved: (value){
                            txtphonenum = value!;
                          },
                          validator: validatePhoneNum,
                        ),
                        TextFormField(
                          controller: addressController,
                          decoration: InputDecoration(labelText:'Home address'),
                          onSaved: (value){
                            txtaddress = value!;
                          },
                          validator: validateAddress,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(labelText:'Email'),
                          onSaved: (value){
                            txtemail = value!;
                          },
                          validator: validateEmail,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(labelText:'Password'),
                          onSaved: (value){
                            txtpassword = value!;
                          },
                          validator: validatePassword,
                        ),
                        TextFormField(
                          controller: roleController,
                          decoration: InputDecoration(labelText:'Role (Customer, Manager or Deliveryman)'),
                          onSaved: (value){
                            txtrole = value!;
                          },
                          validator: validateRole,
                        ),
                        SizedBox(
                          height:30,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    child: Text(
                        'Register'
                    ),
                    onPressed:userRegister,
                   /* {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();

                      }

                    },*/
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[500],
                    ),
                  ),
                ),
                Visibility(
                    visible: visible,
                    child: Container(
                        margin: EdgeInsets.all(20),
                        child: CircularProgressIndicator()
                    ),
                ),
          ],
        ),
       ),
      ),
     ],
    ),
    );
  }

  String? validateName(String? name) {
    if(name!.isEmpty){
      return "Enter your name";
    }
    else{
      return null;
    }
  }

  String? validateEmail(String? email) {
    if(email!.isEmpty){
      return "Enter your email";
    }
    else{
      return null;
    }
  }

  String? validatePassword(String? pass) {
    if(pass!.isEmpty){
      return "Enter your password";
    }
    else{
      return null;
    }
  }

  String? validatePhoneNum(String? num) {
    if(num!.isEmpty){
      return "Enter your phone number";
    }
    else{
      return null;
    }
  }

  String? validateAddress(String? address) {
    if(address!.isEmpty){
      return "Enter your home address";
    }
    else{
      return null;
    }
  }

  String? validateRole(String? role) {
    if(role!.isEmpty){
      return "Enter your role";
    }
    else{
      if(role=="Customer" || role=="Manager" || role=="Deliveryman")
        {
          return null;
        }
      return "Enter role either Customer or Manager";
    }
  }
}