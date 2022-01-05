import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'cleaningPage.dart';

class EditClean extends StatefulWidget {
  final List cleanlist;
  final int index;
  EditClean({required this.cleanlist, required this.index});

  @override
  _EditCleanState createState() => _EditCleanState();
}

class _EditCleanState extends State<EditClean> {
  TextEditingController cleanName = TextEditingController();
  TextEditingController cleanPrice = TextEditingController();

  addUpdateData(){
    var url = 'http://goclean5yeoja.com/serviceDetail/update_clean.php';
    http.post(Uri.parse(url),body: {
      'cleanName': widget.cleanlist[widget.index]['cleanName'],
      'cleanName': cleanName.text,
      'cleanPrice': cleanPrice.text,
    });
    Fluttertoast.showToast(
        msg: "Edit Successful!",
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
    if(widget.index != null){
      cleanName.text = widget.cleanlist[widget.index]['cleanName'];
      cleanPrice.text = widget.cleanlist[widget.index]['cleanPrice'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Data'),),
      backgroundColor: Colors.blue[100],
      body: ListView(
        children: [
          SizedBox(height: 10.0,),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cleanName,
                decoration: InputDecoration(
                  labelText: 'Clean',
                ),
              ),
            ),
          ),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cleanPrice,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.blue[500],
              child: Text('Update',
                style: TextStyle(color: Colors.white),),
              onPressed: (){
                // setState(() {
                addUpdateData();
                // });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CleanPage()));
                //Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
