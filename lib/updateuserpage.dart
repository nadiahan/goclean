import 'package:flutter/material.dart';
import 'package:goclean/userpage.dart';
import 'dvrMain.dart';
import 'package:http/http.dart' as http;

class UserProfileForm extends StatefulWidget{

  final List list;
  final int index;

  UserProfileForm({required this.list, required this.index});

  @override
  _UserProfileForm createState()=> new _UserProfileForm();
}

class _UserProfileForm extends State<UserProfileForm>{

  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController phonenumController;
  late TextEditingController emailController;
  late TextEditingController passController;

  void editUserData(){
    http.post(Uri.parse("http://goclean5yeoja.com/edituserdata.php"),
        body: {
          "id":widget.list[widget.index]["id"],
          "name":nameController.text,
          "address":addressController.text,
          "phonenum":phonenumController.text,
          "email":emailController.text,
          "pass":passController.text,
        }
    );
  }

  @override
  void initState() {
    nameController = new TextEditingController(text: widget.list[widget.index]['name']);
    addressController = new TextEditingController(text: widget.list[widget.index]['address']);
    phonenumController = new TextEditingController(text: widget.list[widget.index]['phonenum']);
    emailController = new TextEditingController(text: widget.list[widget.index]['email']);
    passController = new TextEditingController(text: widget.list[widget.index]['password']);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Go Clean',
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w500
            ),),),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new TextField(
                        controller: nameController,
                        decoration: new InputDecoration(
                            labelText: "Name"
                        )
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    new TextField(
                        controller: addressController,
                        decoration: new InputDecoration(
                            labelText: "Home Address"
                        )
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    new TextField(
                        controller: phonenumController,
                        decoration: new InputDecoration(
                            labelText: "Phone Number"
                        )
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    new TextField(
                        controller: emailController,
                        decoration: new InputDecoration(
                            labelText: "Email"
                        )
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    new TextField(
                        controller: passController,
                        decoration: new InputDecoration(
                            labelText: "Password"
                        )
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    new ElevatedButton(
                      onPressed: (){
                        editUserData();
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> UserPage()));;
                      },
                      child: Text("Update"
                      ),
                      style:ElevatedButton.styleFrom(
                        primary: Colors.blue[500],
                      ),
                    )
                  ],
                )
              ],
            )
        )
    );
  }
}