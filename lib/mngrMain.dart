import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'main.dart';
import 'view_order_list.dart';
import 'view_order_history.dart';
import 'serviceDetail/serviceDetail.dart';
import 'view_laundrette.dart';
import 'reviews.dart';
import 'userpage.dart';


class ManagerMenu extends StatefulWidget {
  const ManagerMenu({Key? key}) : super(key: key);

  @override
  _ManagerMenuState createState() => _ManagerMenuState();
}

class _ManagerMenuState extends State<ManagerMenu> {
  @override
  Widget build(BuildContext context) {
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
        actions: <Widget> [
          IconButton(
            icon: Icon(
              Icons.logout,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              //navigate back to login page
              FlutterSession().set('tokenM','');
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top:10, left:10, right:10),
          child: Column(
            children: [
              FutureBuilder(
                  future: FlutterSession().get('tokenM'),
                  builder: (context, AsyncSnapshot snapshot){
                    return Text(snapshot.hasData ? snapshot.data : 'Loading...',
                        style: TextStyle(color: Colors.white,
                    ),);
                  }),
              Row(
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
              SizedBox(height: 15,),
              Container(
                //navigate to order page
                width: 350,
                height: 75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.8),
                        Colors.lightBlueAccent.withOpacity(0.6),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),

                child: Container (
                  padding: const EdgeInsets.only(top: 20),
                  child: Column (
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderListPage()));
                        },
                        child: Text (
                          "Orders",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: 350,
                height: 75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.8),
                        Colors.lightBlueAccent.withOpacity(0.6),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Container (
                  padding: const EdgeInsets.only(top: 20),
                  child: Column (
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderHistoryPage()));
                        },
                        child: Text (
                          "Order History",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: 350,
                height: 75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.8),
                        Colors.lightBlueAccent.withOpacity(0.6),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Container (
                  padding: const EdgeInsets.only(top: 20),
                  child: Column (
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceMenu()));
                        },
                        child: Text (
                          "Service Details",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: 350,
                height: 75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.8),
                        Colors.lightBlueAccent.withOpacity(0.6),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Container (
                  padding: const EdgeInsets.only(top: 20),
                  child: Column (
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LaundrettePage()));
                        },
                        child: Text (
                          "Your Laundrette",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: 350,
                height: 75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.8),
                        Colors.lightBlueAccent.withOpacity(0.6),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Container (
                  padding: const EdgeInsets.only(top: 20),
                  child: Column (
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewsPage()));
                        },
                        child: Text (
                          "Customer Reviews",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
