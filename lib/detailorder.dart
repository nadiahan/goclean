import 'package:flutter/material.dart';

class DetailOrder extends StatefulWidget{

  List list;
  int index;
  DetailOrder({required this.index,required this.list});

  @override
  _DetailOrder createState()=> new _DetailOrder();
}

class _DetailOrder extends State<DetailOrder>{

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
        body: new Container(
            padding:  const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.blue[50],
            ),
            child: new Card(
                child: Center(
                  child: new Column(
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Text(
                          "User ID : ${widget.list[widget.index]['id']}",
                          style: new TextStyle(fontSize: 20.0, color: Colors.blue[600]),
                        ),),
                      new Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Text(
                          "Order ID : ${widget.list[widget.index]['orderID']}",
                          style: new TextStyle(fontSize: 20.0, color: Colors.blue[600]),
                        ),),
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "Order Date : ${widget.list[widget.index]['orderDate']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "Order Time : ${widget.list[widget.index]['orderTime']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "Clean Name : ${widget.list[widget.index]['cleanName']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "Service Name : ${widget.list[widget.index]['serviceName']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "Address : ${widget.list[widget.index]['newAddress']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "Material Name : ${widget.list[widget.index]['materialName']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "Order Status : ${widget.list[widget.index]['orderStatus']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "Status Time : ${widget.list[widget.index]['statusTime']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "Total Price : RM ${widget.list[widget.index]['totalPrice']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                      ),
                    ],
                  ),
                )
            )
        )
    );
  }
}