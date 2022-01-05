import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'detail.dart';
import 'mydetail.dart';

class OrderHistoryList extends StatefulWidget {
  const OrderHistoryList({Key? key}) : super(key: key);

  @override
  _OrderHistoryList createState() => _OrderHistoryList();
}

class _OrderHistoryList extends State<OrderHistoryList> {

  Future<List> _getMyOrderHistory() async {
    final response = await http.post(Uri.parse("http://goclean5yeoja.com/getdataordercustomer.php"));
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
            future: _getMyOrderHistory(),
            builder: (context, snapshot){
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? new ViewMyOrder(list: snapshot.data??[],)
                  : new Center( child: new CircularProgressIndicator(),);
            }
        )
    );
  }
}

class ViewMyOrder extends StatelessWidget{

  final List list;
  ViewMyOrder({required this.list});

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i){
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context)=> new CustDetail(list: list,index: i,)
              ),
            ),
            child: Card(
              child: new ListTile(
                title: new Text("Order : ${list[i]["orderID"]} | ${list[i]["orderStatus"]}"),

              ),
            ),
          ),
        );
      },
    );
  }
}