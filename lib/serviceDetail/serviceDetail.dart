import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cleaningPage.dart';
import 'package:goclean/userpage.dart';
import 'package:goclean/mngrMain.dart';
import 'servicePage.dart';
import 'materialpage.dart';

class ServiceMenu extends StatefulWidget {
  const ServiceMenu({Key? key}) : super(key: key);

  @override
  _ServiceMenuState createState() => _ServiceMenuState();
}

class _ServiceMenuState extends State<ServiceMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton (
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ManagerMenu()));
          },
          icon: Icon(Icons.home_outlined),
        ),
        centerTitle: true,
        title: Text('Go Clean'),
        backgroundColor: Colors.blue[500],

      ),
      body: Container(
        padding: const EdgeInsets.only(top:10, left:10, right:10),
        /*decoration: BoxDecoration(
          color: Colors.blue[50],
        ),*/
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Service Details",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              //navigate to order page
              width: MediaQuery.of(context).size.width,
              height: 80,
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
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),

              child: Container (
                padding: const EdgeInsets.only(top: 20),
                child: Column (
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicePage()));
                      },
                      child: Text (
                        "Type of Service",
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
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
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
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container (
                padding: const EdgeInsets.only(top: 20),
                child: Column (
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CleanPage()));
                      },
                      child: Text (
                        "Cleaning Method",
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
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
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
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container (
                padding: const EdgeInsets.only(top: 20),
                child: Column (
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MatPage()));
                      },
                      child: Text (
                        "Material",
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
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}