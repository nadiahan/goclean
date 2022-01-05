import 'package:flutter/material.dart';

import 'cardpay.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPage createState() => _PaymentPage();
}

class _PaymentPage extends State<PaymentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Go Clean'),
        backgroundColor: Colors.blue[500],
        ),
      body: Stack(
            children: <Widget>[
            Container(
            decoration: BoxDecoration(
            color: Colors.blue[50],
            ),
            ),

            SingleChildScrollView(
            child:Column(
            children: <Widget>[
                Container(
                padding:EdgeInsets.only(top: 40),
                child:
                Align(
                alignment: Alignment(0.0,-0.2),
                child: Text("Choose your payment method", style: TextStyle(
                fontSize: 20,
                color: Colors.blue[500],
                fontWeight: FontWeight.bold
                ),
                ),),
                ),
                Padding(
                padding: EdgeInsets.all(30),
                child: Align(
                alignment: Alignment(0.0,-0.8),
                child: Image(
                image: AssetImage('images/payment.png'),
                width: 100,
                height: 100,
                ),),
                ),
              Center(
                child:Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.all(10),
                      child:Column(
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[500], // background
                                onPrimary: Colors.white, // foreground
                                fixedSize: Size.fromWidth(250)
                              ),
                              onPressed: () { },
                              child: Text('Cash on Delivery (COD)'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[500], // background
                                onPrimary: Colors.white, // foreground
                                fixedSize: Size.fromWidth(250)
                              ),
                              onPressed: () {
                                //Navigator.push(context,MaterialPageRoute(builder: (context)=> CardPayPage()));
                              },
                              child: Text('Credit/Debit Card'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[500], // background
                                onPrimary: Colors.white, // foreground
                                fixedSize: Size.fromWidth(250)
                              ),
                              onPressed: () { },
                              child: Text('Online Banking'),
                            )
                          ]
                ),
              ),
              )
              ),
                Padding(
                padding: EdgeInsets.only(top: 180),
                child: Align(
                  alignment: Alignment(0.0,1),
                  child:Text("Icons made by Vectors Market from Flaticon", style: TextStyle(color: Colors.blueGrey)),
              ),
                )
            ]
    )
    )
    ]
    )
    );
  }
}