import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'editMaterial.dart';
import 'serviceDetail.dart';
import 'package:http/http.dart' as http;


class MatPage extends StatefulWidget {
  const MatPage({Key? key}) : super(key: key);
  @override
  _MatPageState createState() => _MatPageState();
}

class _MatPageState extends State<MatPage> {

  static const url = 'http://goclean5yeoja.com/serviceDetail/view_material.php';
  List materiallist = [];

  Future getMaterial()async{
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      setState(() {
        materiallist = json.decode(response.body);
      });
      //return json.decode(response.body);
      return materiallist;
    }
  }

  delete(){
    Fluttertoast.showToast(
        msg: "One material deleted!",
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
    getMaterial();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Material',
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
            },
          ),
        ],
      ),
      backgroundColor: Colors.blue[50],
      body: FutureBuilder(
          future: getMaterial(),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditMaterial(materiallist: materiallist, index: index,),),);
                        debugPrint('Edit Clicked');
                      },),
                    title: Text(
                      materiallist[index]['materialName'],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:Colors.blueGrey[900]),),
                    subtitle: Text('RM'+materiallist[index]['materialPrice'],
                      style: TextStyle(fontSize: 16, color:Colors.blueGrey[900]),),
                    trailing: GestureDetector(child: Icon(Icons.delete, color: Colors.red[500]),
                      onTap: (){
                        var DELETE_URL = 'http://goclean5yeoja.com/serviceDetail/delete_material.php';
                        http.post(Uri.parse(DELETE_URL), body:{
                          'materialName' : materiallist[index]['materialName'],
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
    String materialName = '';
    String materialPrice = '';
    void insertData(){
      var ADD_URL = 'http://goclean5yeoja.com/serviceDetail/add_material.php';
      http.post(Uri.parse(ADD_URL), body:{
        'materialName':materialName,
        'materialPrice':materialPrice,
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
                    materialName = value;
                  });
                },

                onFieldSubmitted: (v){

                },
                decoration: InputDecoration(labelText: 'Material'),
              ),
              TextFormField(
                onChanged: (String value){
                  setState(() {
                    materialPrice = value;
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MatPage()));
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

