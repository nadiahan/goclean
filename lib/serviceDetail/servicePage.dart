import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'serviceDetail.dart';
import 'package:http/http.dart' as http;
import 'editService.dart';


class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {

  static const url = 'http://goclean5yeoja.com/serviceDetail/view_service.php';
  List servicelist = [];

  get index => null;

  Future getService()async{
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      setState(() {
        servicelist = json.decode(response.body);
      });
      //return json.decode(response.body);
      return servicelist;
    }
  }

  delete(){
    Fluttertoast.showToast(
        msg: "One service deleted!",
        toastLength: Toast.LENGTH_SHORT,
        gravity:ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.grey[700],
        textColor: Colors.white,
        fontSize: 16
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getService();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Type of Service',
          style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w500
          ),
        ),
        backgroundColor: Colors.blue[500],
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              alertDialog();
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEditService(servicelist: servicelist, index: index),),);
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: getService(),
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  return ListTile(
                    contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
                    leading: GestureDetector(child: Icon(Icons.edit, color: Colors.blue[500]),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditService(servicelist: servicelist, index: index,),),);
                        debugPrint('Edit Clicked');
                      },),
                    title: Text(
                      servicelist[index]['serviceName'],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:Colors.blueGrey[900]),),
                    subtitle: Text('RM'+servicelist[index]['servicePrice'],
                      style: TextStyle(fontSize: 16, color:Colors.blueGrey[900]),),
                    trailing: GestureDetector(child: Icon(Icons.delete, color: Colors.red[500]),
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditService(servicelist: servicelist, index: index,),),);
                        var DELETE_URL = 'http://goclean5yeoja.com/serviceDetail/delete_service.php';
                        http.post(Uri.parse(DELETE_URL), body:{
                          'serviceName' : servicelist[index]['serviceName'],
                        });
                        delete();
                        debugPrint('Delete Clicked');
                      },),
                  );
                }
            ) : CircularProgressIndicator();
          }

      ),

    );
  }
  Future<dynamic> alertDialog(){
    String serviceName = '';
    String servicePrice = '';
    void insertData(){
      var ADD_URL = 'http://goclean5yeoja.com/serviceDetail/add_service.php';
      http.post(Uri.parse(ADD_URL), body:{
        'serviceName':serviceName,
        'servicePrice':servicePrice,
      });
      Fluttertoast.showToast(
          msg: "Add Successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.grey[700],
          textColor: Colors.white,
          fontSize: 16
      );
    }

    return showDialog(
      context: context, builder: (context) => new AlertDialog(
        title: Column(
            children: [
              TextFormField(
                onChanged: (String value){
                  setState(() {
                    serviceName = value;
                  });
                },

                onFieldSubmitted: (v){

                },
                decoration: InputDecoration(labelText: 'Service'),
              ),
              TextFormField(
                onChanged: (String value){
                  setState(() {
                    servicePrice = value;
                  });
                },

                onFieldSubmitted: (v){
                  insertData();
                },
                decoration: InputDecoration(labelText: 'Price'),
              ),
              Container(
                width: 300.0,
                margin: EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                  color: Colors.blue[500],
                  onPressed: () {
                    insertData();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicePage()));
                  },
                  child: Text('Insert Data', style: TextStyle(color: Colors.white),),
                ),
              ),
            ]
        )
    ),
    );
  }
}

