import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'serviceDetail.dart';
import 'package:http/http.dart' as http;
import 'editClean.dart';


class CleanPage extends StatefulWidget {
  const CleanPage({Key? key}) : super(key: key);
  @override
  _CleanPageState createState() => _CleanPageState();
}

class _CleanPageState extends State<CleanPage> {

  static const url = 'http://goclean5yeoja.com/serviceDetail/view_clean.php';
  List cleanlist = [];

  Future getClean()async{
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      setState(() {
        cleanlist = json.decode(response.body);
      });
      //return json.decode(response.body);
      return cleanlist;
    }
  }

  delete(){
    Fluttertoast.showToast(
        msg: "One data deleted!",
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
    getClean();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cleaning Method',
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
          future: getClean(),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditClean(cleanlist: cleanlist, index: index,),),);
                        debugPrint('Edit Clicked');
                      },),
                    title: Text(
                      cleanlist[index]['cleanName'],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:Colors.blueGrey[900]),),
                    subtitle: Text('RM'+cleanlist[index]['cleanPrice'],
                      style: TextStyle(fontSize: 16, color:Colors.blueGrey[900]),),
                    trailing: GestureDetector(child: Icon(Icons.delete, color: Colors.red[500]),
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditService(servicelist: servicelist, index: index,),),);
                        var DELETE_URL = 'http://goclean5yeoja.com/serviceDetail/delete_clean.php';
                        http.post(Uri.parse(DELETE_URL), body:{
                          'cleanName' : cleanlist[index]['cleanName'],
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
    String cleanName = '';
    String cleanPrice = '';
    void insertData(){
      var ADD_URL = 'http://goclean5yeoja.com/serviceDetail/add_clean.php';
      http.post(Uri.parse(ADD_URL), body:{
        'cleanName':cleanName,
        'cleanPrice':cleanPrice,
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
                    cleanName = value;
                  });
                },

                onFieldSubmitted: (v){

                },
                decoration: InputDecoration(labelText: 'Cleaning Method'),
              ),
              TextFormField(
                onChanged: (String value){
                  setState(() {
                    cleanPrice = value;
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CleanPage()));
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

