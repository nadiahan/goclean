import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goclean/custMain.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'mngrMain.dart';
import 'laundrette_edit_form.dart';
import 'package:goclean/laundrette.dart';
import 'laundretteController.dart';

class CustLaundrettePage extends StatefulWidget {
  const CustLaundrettePage({Key? key}) : super(key: key);
  @override
  _CustLaundrettePage createState() => _CustLaundrettePage();
}

class _CustLaundrettePage extends State<CustLaundrettePage> {

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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CMenuPage()));
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