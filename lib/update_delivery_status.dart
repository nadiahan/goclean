import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'detail.dart';

class UpdateDeliveryPage extends StatefulWidget {
  const UpdateDeliveryPage({Key? key}) : super(key: key);

  @override
  _UpdateDeliveryPage createState() => _UpdateDeliveryPage();
}

class _UpdateDeliveryPage extends State<UpdateDeliveryPage> {

  Future<List> _getDataOrderDel() async {
    final response = await http.post(Uri.parse("http://goclean5yeoja.com/getdataorderdel.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text('Go Clean',
        style: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.w500
    ),),),
    body: new FutureBuilder<List>(
      future: _getDataOrderDel(),
      builder: (context, snapshot){
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
        ? new OrderList(list: snapshot.data??[],)
        : new Center( child: new CircularProgressIndicator(),);
    }
    )
    );
  }
}

class OrderList extends StatelessWidget{

  final List list;
  OrderList({required this.list});

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i){
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context)=> new Detail(list: list,index: i,)
              ),
              ),
            child: Card(
              child: new ListTile(
                title: new Text("Order : ${list[i]["orderID"]} | ${list[i]["orderStatus"]}"),
              ),
            ),
            ),
          ),
        );
    },
    );
  }
}