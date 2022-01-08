import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:goclean/about_us_page.dart';
import 'package:goclean/customer_view_status.dart';
import 'package:goclean/view_my_order.dart';
import 'custLaundrette.dart';
import 'customer_order_page.dart';
import 'userpage.dart';
import 'main.dart';

class CMenuPage extends StatefulWidget {
  const CMenuPage({Key? key}) : super(key: key);

  @override
  _CMenuPage createState() => _CMenuPage();
}
class _CMenuPage extends State<CMenuPage>{
  @override
  Widget build(BuildContext Context){
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Go Clean',
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w500
            ),),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue[500],
          leading: IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UserPage()));
            },
          ),
          actions: <Widget> [IconButton(
            icon: Icon(
              Icons.logout,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              //navigate back to login page
              FlutterSession().set('tokenC','');
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),
          ],
        ),
        body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                  ),
                  child: Column(
                    children: [

                      FutureBuilder(
                          future: FlutterSession().get('tokenC'),
                          builder: (context, AsyncSnapshot snapshot){
                            return Text(snapshot.hasData ? snapshot.data : 'Loading...',
                              style: TextStyle(color: Colors.white,fontSize: 1
                              ),);
                          }),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Menu",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue[500],
                                  fontWeight: FontWeight.w700
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 170,
                            height: 170,
                            child: Card(
                              child: Container (
                                padding: const EdgeInsets.all(10),
                                child: Column (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          //Navigator.push(context,MaterialPageRoute(builder: (context)=> CustomerOrderPage()));
                                        },
                                        child: Image(
                                          image: AssetImage('images/order.png'),
                                          width: 90,
                                          height: 90,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        //Navigator.push(context,MaterialPageRoute(builder: (context)=> CustomerOrderPage()));
                                      },
                                      child: Text (
                                        "Start Order",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blue[500],
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 170,
                            height: 170,
                            child: Card(
                              child: Container (
                                padding: const EdgeInsets.all(10),
                                child: Column (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,MaterialPageRoute(builder: (context)=> CustomerViewStatus()));
                                        },
                                        child: Image(
                                          image: AssetImage('images/delivery.png'),
                                          width: 90,
                                          height: 90,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=> CustomerViewStatus()));
                                      },
                                      child: Text (
                                        "Order Status",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blue[500],
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 170,
                            height: 170,
                            child: Card(
                              child: Container (
                                padding: const EdgeInsets.all(10),
                                child: Column (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          //Navigator.push(context,MaterialPageRoute(builder: (context)=> OrderHistoryList()));
                                        },
                                        child: Image(
                                          image: AssetImage('images/clock.png'),
                                          width: 90,
                                          height: 90,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        //Navigator.push(context,MaterialPageRoute(builder: (context)=> OrderHistoryList()));
                                      },
                                      child: Text (
                                        "Order History",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blue[500],
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 170,
                            height: 170,
                            child: Card(
                              child: Container (
                                padding: const EdgeInsets.all(10),
                                child: Column (
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context,MaterialPageRoute(builder: (context)=> CustLaundrettePage()));
                                        },
                                        child: Image(
                                          image: AssetImage('images/information.png'),
                                          width: 90,
                                          height: 90,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=> CustLaundrettePage()));
                                      },
                                      child: Text (
                                        "About Us Page",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blue[500],
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),],),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 170,
                              height: 170,
                              child: Card(
                                child: Container (
                                  padding: const EdgeInsets.all(10),
                                  child: Column (
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=> AboutUsPage()));
                                          },
                                          child: Image(
                                            image: AssetImage('images/rating.png'),
                                            width: 90,
                                            height: 90,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context,MaterialPageRoute(builder: (context)=> AboutUsPage()));
                                        },
                                        child: Text (
                                          "Rate Us",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.blue[500],
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Text("All icons are from Flaticon", style: TextStyle(color: Colors.blueGrey)),
                            ),
                          ]
                      )
                    ],
                  ),
                ),
              ),
            ]
        )
    );
  }
}