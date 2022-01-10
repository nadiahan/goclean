import 'package:flutter/material.dart';
import 'dvrMain.dart';
import 'package:http/http.dart' as http;

class EditOrderStatus extends StatefulWidget{

  final List list;
  final int index;

  EditOrderStatus({required this.list, required this.index});

  @override
  _EditOrderStatus createState()=> new _EditOrderStatus();
}

class _EditOrderStatus extends State<EditOrderStatus>{

  late TextEditingController statusController;
  late TextEditingController timeController;

  void editData(){
    http.post(Uri.parse("http://goclean5yeoja.com/editstatus.php"),
      body: {
      "orderID":widget.list[widget.index]["orderID"],
        "orderStatus":statusController.text,
        "statusTime":timeController.text,
      }
    );
  }

  @override
  void initState() {
    statusController = new TextEditingController(text: widget.list[widget.index]['orderStatus']);
    timeController = new TextEditingController(text: widget.list[widget.index]['statusTime']);
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
                  controller: statusController,
                  decoration: new InputDecoration(
                    labelText: "Order Status"
                  )
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new TextField(
                    controller: timeController,
                    decoration: new InputDecoration(
                        labelText: "Status Time"
                    )
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new ElevatedButton(
                    onPressed: (){
                      editData();
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> DMenuPage()));;
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