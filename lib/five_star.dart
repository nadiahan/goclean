import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:get/get.dart';
import 'mngrMain.dart';
import 'reviews.dart';

class FiveStar extends StatefulWidget {
  const FiveStar({Key? key}) : super(key: key);

  @override
  _FiveStarState createState() => _FiveStarState();
}

class _FiveStarState extends State<FiveStar> {
  static const url = 'http://goclean5yeoja.com/view_review_5.php';
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewsPage()));
          },
          icon: Icon(Icons.arrow_back_ios),
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

      body: FutureBuilder(
          future: getRevlist(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[200],
                    margin: EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 30.0, right: 20.0),
                      title: Text(
                        revlist[index]['_rating'] + " stars",
                        style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900]),),
                      subtitle: Text(revlist[index]['comment'],
                        style: TextStyle(fontSize: 16, color:Colors.blueGrey[900]),),
                    ),
                  );
                }
            ) : CircularProgressIndicator();
          }
      ),
    );
  }
}
