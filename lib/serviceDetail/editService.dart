import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'servicePage.dart';

class EditService extends StatefulWidget {
  final List servicelist;
  final int index;
  EditService({required this.servicelist, required this.index});

  @override
  _EditServiceState createState() => _EditServiceState();
}

class _EditServiceState extends State<EditService> {
  TextEditingController serviceName = TextEditingController();
  TextEditingController servicePrice = TextEditingController();

  addUpdateData(){
    var url = 'http://goclean5yeoja.com/serviceDetail/update_service.php';
    http.post(Uri.parse(url),body: {
      'serviceName': widget.servicelist[widget.index]['serviceName'],
      'serviceName': serviceName.text,
      'servicePrice': servicePrice.text,
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
      serviceName.text = widget.servicelist[widget.index]['serviceName'];
      servicePrice.text = widget.servicelist[widget.index]['servicePrice'];
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
          SizedBox(height: 5,),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: serviceName,
                decoration: InputDecoration(
                  labelText: 'Service',
                ),
              ),
            ),
          ),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: servicePrice,
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicePage()));
                //Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
