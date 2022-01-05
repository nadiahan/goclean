import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_session/flutter_session.dart';
import 'vieworderlistdel.dart';
import 'update_delivery_status.dart';
import 'main.dart';
import 'userpage.dart';

class DMenuPage extends StatefulWidget {
  const DMenuPage({Key? key}) : super(key: key);

  @override
  _DMenuPage createState() => _DMenuPage();
}
class _DMenuPage extends State<DMenuPage>{
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
              FlutterSession().set('tokenD','');
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

                      Padding(
                        padding: const EdgeInsets.only(bottom:20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
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
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderListDel()));
                                          },
                                          child: Image(
                                            image: AssetImage('images/logistic.png'),
                                            width: 90,
                                            height: 90,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderListDel()));
                                        },
                                        child: Text (
                                          "Order List",
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
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
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateDeliveryPage()));
                                        },
                                        child: Image(
                                          image: AssetImage('images/clipboard.png'),
                                          width: 90,
                                          height: 90,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateDeliveryPage()));
                                      },
                                      child: Text (
                                        "Update Status",
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
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 140),
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