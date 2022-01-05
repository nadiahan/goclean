import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'materialPage.dart';

class EditMaterial extends StatefulWidget {
  final List materiallist;
  final int index;
  EditMaterial({required this.materiallist, required this.index});

  @override
  _EditMaterialState createState() => _EditMaterialState();
}

class _EditMaterialState extends State<EditMaterial> {
  TextEditingController materialName = TextEditingController();
  TextEditingController materialPrice = TextEditingController();

  addUpdateData(){
    var url = 'http://goclean5yeoja.com/serviceDetail/update_material.php';
    http.post(Uri.parse(url),body: {
      'materialName': widget.materiallist[widget.index]['materialName'],
      'materialName': materialName.text,
      'materialPrice': materialPrice.text,
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
      materialName.text = widget.materiallist[widget.index]['materialName'];
      materialPrice.text = widget.materiallist[widget.index]['materialPrice'];
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: materialName,
              decoration: InputDecoration(
                labelText: 'Material',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: materialPrice,
              decoration: InputDecoration(
                labelText: 'Price',
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MatPage()));
                //Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
