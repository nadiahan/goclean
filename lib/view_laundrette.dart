import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'mngrMain.dart';
import 'laundrette_edit_form.dart';
import 'package:goclean/laundrette.dart';
import 'laundretteController.dart';

class LaundrettePage extends StatefulWidget {
  const LaundrettePage({Key? key}) : super(key: key);
  @override
  _LaundrettePageState createState() => _LaundrettePageState();
}

class _LaundrettePageState extends State<LaundrettePage> {

  static const url = 'http://goclean5yeoja.com/view_laundrette.php';
  List laund = [];

  Future getLaundInfo() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        laund = json.decode(response.body);
      });
      //return json.decode(response.body);
      return laund;
    }

  }

  @override
  void initState() {
    super.initState();
    getLaundInfo();
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
        title: Text('Your Laundrette',
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
          future: getLaundInfo(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 5,),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(25.0),
                            child:
                            Align(
                              alignment: Alignment.centerLeft,
                              child:Text(
                                'Name : ' + laund[index]['name'],
                                style: TextStyle(fontSize: 18, color:Colors.blueGrey[900]),
                              ),),),),
                        Card(
                          child:
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child:
                              Text(
                                'Email : ' + laund[index]['email'],
                                style: TextStyle(fontSize: 18, color:Colors.blueGrey[900]),
                              ),),),),
                        Card(
                          child:
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child:
                            Align(
                              alignment: Alignment.centerLeft,
                              child:
                              Text(
                                'Phone Number : ' + laund[index]['phonenum'],
                                style: TextStyle(fontSize: 18, color:Colors.blueGrey[900]),
                              ),),),),
                        Card(
                          child:
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child:
                            Align(
                              alignment: Alignment.centerLeft,
                              child:
                              Text(
                                'Address : ' + laund[index]['address'],
                                style: TextStyle(fontSize: 18, color:Colors.blueGrey[900]),
                              ),),),),
                        Card(
                          child:
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child:
                            Align(
                              alignment: Alignment.centerLeft,
                              child:
                              Text(
                                'Business Day : ' + laund[index]['busday'],
                                style: TextStyle(fontSize: 18, color:Colors.blueGrey[900]),
                              ),),),),
                        Card(
                          child:
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child:
                            Align(
                              alignment: Alignment.centerLeft,
                              child:
                              Text(
                                'Business Hour : ' + laund[index]['bushour'],
                                style: TextStyle(fontSize: 18, color:Colors.blueGrey[900]),
                              ),),),),
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
                            padding: const EdgeInsets.only(top: 5),
                            child: Column (
                              children: [
                                InkWell(
                                  onTap: () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>LaundretteForm()));
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => LaundretteForm(laund: laund, index: index,))).then((value)=>getLaundInfo());
                                  },
                                  child: Text (
                                    "Edit",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                  return ListTile();
                }
            ) : CircularProgressIndicator();
          }

      ),
    );
  }
}