import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'customer_order_status_2.dart';

class CustomerViewStatus extends StatefulWidget {
  const CustomerViewStatus({Key? key}) : super(key: key);

  @override
  _CustomerViewStatus createState() => _CustomerViewStatus();
}

class _CustomerViewStatus extends State<CustomerViewStatus> {

  late String idValue;

  Future<List> _getOrderViewStatus() async {
    final response = await http.post(Uri.parse("http://goclean5yeoja.com/getorderviewstatus.php"), body:{
      "userID": idValue,
    });
    return json.decode(response.body);
  }

  @override
  initState(){
    super.initState();
    getId();
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
        body: FutureBuilder<List>(
            future: _getOrderViewStatus(),
            builder: (context, snapshot){
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? new OrderViewStatusList(list: snapshot.data??[],)
                  : new Center( child: new CircularProgressIndicator(),);
            }
        )
    );
  }
  void getId() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    idValue = pref.getString('idData');
    print(idValue);
    setState((){

    });
  }
}

class OrderViewStatusList extends StatelessWidget{

  final List list;
  OrderViewStatusList({required this.list});

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
                    builder: (BuildContext context)=> new OrderViewStatus(list: list,index: i,)
                ),
              ),
              child: Card(
                color: Colors.grey[200],
                margin: EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0),
                child: new ListTile(
                  contentPadding: EdgeInsets.only(left: 30.0, right: 20.0),
                  title: Text(
                    "Order #" + list[i]['orderID'],
                    style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900]),),
                  subtitle: Text(list[i]['orderDate'] + " / " + list[i]['orderTime'],
                    style: TextStyle(fontSize: 16, color:Colors.blueGrey[900]),),
                  trailing: GestureDetector(child: Icon(Icons.arrow_forward_ios, color: Colors.black),
                    onTap: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerViewStatus(orderlist: orderlist, index: index,),),);
                    },),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}