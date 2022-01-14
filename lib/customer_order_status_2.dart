import 'package:flutter/material.dart';

class OrderViewStatus extends StatefulWidget{

  List list;
  int index;
  OrderViewStatus({required this.index,required this.list});

  @override
  _OrderViewStatus createState()=> new _OrderViewStatus();
}

class _OrderViewStatus extends State<OrderViewStatus>{

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
        body:


        new Container(
            padding:  const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: new Card(
                child: Center(
                  child: new Column(
                    children: <Widget>[

                      new Padding(
                        padding: const EdgeInsets.fromLTRB(10.0,20.0,10.0,10.0),
                        child: new Text(
                          "Order ID : ${widget.list[widget.index]['orderID']}",
                          style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0, color: Colors.blue[600]),
                        ),),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 1,
                        color: Colors.grey,
                      ),

                      Center (
                        child: Text(
                          widget.list[widget.index]['orderStatus'],
                          style: TextStyle(
                              fontSize: 28, color: Colors.green,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center (
                        child: Text(
                          widget.list[widget.index]['statusTime'],
                          style: TextStyle(
                              fontSize: 20, color: Colors.black26),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "    Order Date : " +  widget.list[widget.index]['orderDate'],
                          style: TextStyle(
                              fontSize: 18, color: Colors.blueGrey[900]),
                        ),),
                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "    Order Time : " +  widget.list[widget.index]['orderTime'],
                          style: TextStyle(
                              fontSize: 18, color: Colors.blueGrey[900]),
                        ),),


                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "    Service Details : " +  widget.list[widget.index]['serviceName'],
                          style: TextStyle(
                              fontSize: 18, color: Colors.blueGrey[900]),
                        ),),
                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "    Cleaning Type : " +  widget.list[widget.index]['cleanName'],
                          style: TextStyle(
                              fontSize: 18, color: Colors.blueGrey[900]),
                        ),),

                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "    Materials : " +  widget.list[widget.index]['materialName'],
                          style: TextStyle(
                              fontSize: 18, color: Colors.blueGrey[900]),
                        ),),
                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "    New Address : " +  widget.list[widget.index]['newAddress'],
                          style: TextStyle(
                              fontSize: 18, color: Colors.blueGrey[900]),
                        ),),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "    Total Price : RM " +  widget.list[widget.index]['totalPrice'],
                          style: TextStyle(
                              fontSize: 20, color: Colors.blueGrey[900]),
                        ),),

                    ],
                  ),
                )
            )
        )


    );
  }
}