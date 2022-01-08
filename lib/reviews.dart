import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:get/get.dart';
import 'mngrMain.dart';
import 'five_star.dart';
import 'four_star.dart';
import 'three_star.dart';
import 'two_star.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {

  static const url = 'http://goclean5yeoja.com/view_review_list.php';
  List revlist = [];

  Future getRevlist() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        revlist = json.decode(response.body);
      });
      //return json.decode(response.body);
      return revlist;
    }
  }

  @override
  void initState() {
    super.initState();
    getRevlist();
  }

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
        title: Text('Customer Reviews',
          style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w500
          ),
        ),
        backgroundColor: Colors.blue[500],
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top:10, left:10, right:10),
          child: Column(
            children: [
              FutureBuilder(
                  future: getRevlist(),
                  builder: (context, AsyncSnapshot snapshot){
                    return Text("Total Customer Reviews : ${revlist.length}",
                      style: TextStyle(
                      ),);
                  }),

              SizedBox(height: 50,),
              Center(
                child: Container(
                  //navigate to order page
                  width: 250,
                  height: 65,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.green.withOpacity(0.8),
                          Colors.lightGreenAccent.withOpacity(0.6),
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
                    padding: const EdgeInsets.only(top: 15),
                    child: Column (
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>FiveStar()));
                          },
                          child: Text (
                            "5 Stars",
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
              ),
              SizedBox(height: 15,),
              Container(
                width: 250,
                height: 65,
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
                  padding: const EdgeInsets.only(top: 15),
                  child: Column (
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FourStar()));
                        },
                        child: Text (
                          "4 Stars",
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
                width: 250,
                height: 65,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.yellow.withOpacity(0.8),
                        Colors.yellowAccent.withOpacity(0.6),
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
                  padding: const EdgeInsets.only(top: 15),
                  child: Column (
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ThreeStar()));
                        },
                        child: Text (
                          "3 Stars",
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
                width: 250,
                height: 65,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.orange.withOpacity(0.8),
                        Colors.orangeAccent.withOpacity(0.6),
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
                  padding: const EdgeInsets.only(top: 15),
                  child: Column (
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TwoStar()));
                        },
                        child: Text (
                          "2 Stars",
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
                width: 250,
                height: 65,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.deepOrange.withOpacity(0.8),
                        Colors.deepOrangeAccent.withOpacity(0.6),
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
                  padding: const EdgeInsets.only(top: 15),
                  child: Column (
                    children: [
                      InkWell(
                        onTap: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewsPage()));
                        },
                        child: Text (
                          "1 Star",
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
