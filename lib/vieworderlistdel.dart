import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'detail.dart';
import 'detailorder.dart';

class OrderListDel extends StatefulWidget {
  const OrderListDel({Key? key}) : super(key: key);

  @override
  _OrderListDel createState() => _OrderListDel();
}

class _OrderListDel extends State<OrderListDel> {

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
                  ? new ViewOrderList(list: snapshot.data??[],)
                  : new Center( child: new CircularProgressIndicator(),);
            }
        )
    );
  }
}

class ViewOrderList extends StatelessWidget{

  final List list;
  ViewOrderList({required this.list});

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
                  builder: (BuildContext context)=> new DetailOrder(list: list,index: i,)
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