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

      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.blue[50]
              ),
              child: Column(
                children: [
                  FutureBuilder(
                    future: FlutterSession().get('tokenM'),
                    builder: (context, AsyncSnapshot snapshot){
                      return Text(snapshot.hasData ? snapshot.data : 'Loading...',
                          style: TextStyle(color: Colors.white,
                      ),);
                    },
                  ),
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
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=> OrderListPage()));
                                    },
                                    child: Image(
                                      image: AssetImage('images/orderlist.png'),
                                        width: 90,
                                        height: 90,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=> OrderListPage()));
                                  },
                                  child: Text (
                                    "Orders",
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
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=> OrderHistoryPage()));
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
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=> OrderHistoryPage()));
                                  },
                                  child: Text(
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 170,
                        height: 170,
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=> ServiceMenu()));
                                    },
                                    child: Image(
                                      image: AssetImage('images/service detail.png'),
                                      width: 90,
                                      height: 90,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=> ServiceMenu()));
                                  },
                                  child: Text (
                                    "Service Details",
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
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=> LaundrettePage()));
                                    },
                                    child: Image(
                                      image: AssetImage('images/laundrette.png'),
                                      width: 90,
                                      height: 90,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=> LaundrettePage()));
                                  },
                                  child: Text(
                                    "Your Laundrette",
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
                    ],
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
                                      onTap: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=> ReviewsPage()));
                                      },
                                      child: Image(
                                        image: AssetImage('images/review.png'),
                                        width: 90,
                                        height: 90,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=> ReviewsPage()));
                                    },
                                    child: Text (
                                      "Customer Reviews",
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
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
