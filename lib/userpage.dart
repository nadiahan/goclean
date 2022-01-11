import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPage createState() => _UserPage();
}

class _UserPage extends State<UserPage> {

  late String idValue;

  Future<List> _getUserInfo() async {
    final response = await http.post(Uri.parse("http://goclean5yeoja.com/getuserinfo.php"), body:{
      "userID": idValue,
    });
    return json.decode(response.body);
  }

  @override
  initState(){
    super.initState();
    getId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Go Clean',
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w500
            ),),),
        body: new FutureBuilder<List>(
            future: _getUserInfo(),
            builder: (context, snapshot){
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? new UserInfo(list: snapshot.data??[],)
                  : new Center( child: new CircularProgressIndicator(),);
            }
        )
    );
  }
    void getId() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    idValue = pref.getString('idData');
    print(idValue);
    setState((){

    });
  }
}

class UserInfo extends StatelessWidget{

  final List list;
  UserInfo({required this.list});

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return SingleChildScrollView(
          child: Card(
            child:
            Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1)
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/profile.png'),
                        alignment: Alignment.center,
                      )
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(25.0),
                    child:
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'User ID : ${list[i]["id"]}',
                        style: TextStyle(fontSize: 18, color: Colors
                            .blueGrey[900]),
                      ),),),),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(25.0),
                    child:
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name : ${list[i]["name"]}',
                        style: TextStyle(fontSize: 18, color: Colors
                            .blueGrey[900]),
                      ),),),),
                Card(
                  child:
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:
                      Text(
                        'Home address : ${list[i]["address"]}',
                        style: TextStyle(fontSize: 18, color: Colors
                            .blueGrey[900]),
                      ),),),),
                Card(
                  child:
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child:
                    Align(
                      alignment: Alignment.centerLeft,
                      child:
                      Text(
                        'Phone number : ${list[i]["phonenum"]}',
                        style: TextStyle(fontSize: 18, color: Colors
                            .blueGrey[900]),
                      ),),),),
                Card(
                  child:
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child:
                    Align(
                      alignment: Alignment.centerLeft,
                      child:
                      Text(
                        'Email : ${list[i]["email"]}',
                        style: TextStyle(fontSize: 18, color: Colors
                            .blueGrey[900]),
                      ),),),),
                Card(
                  child:
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child:
                    Align(
                      alignment: Alignment.centerLeft,
                      child:
                      Text(
                        'Password : ${list[i]["password"]}',
                        style: TextStyle(fontSize: 18, color: Colors
                            .blueGrey[900]),
                      ),),),),
                Card(
                  child:
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child:
                    Align(
                      alignment: Alignment.centerLeft,
                      child:
                      Text(
                        'Role : ${list[i]["role"]}',
                        style: TextStyle(fontSize: 18, color: Colors
                            .blueGrey[900]),
                      ),),),),
              ],
            ),
          ),
        );
      }
    );
  }
}

