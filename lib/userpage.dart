import 'package:flutter/material.dart';
import 'package:goclean/user-api.dart';
import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'editacc.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPage createState() => _UserPage();
}

class _UserPage extends State<UserPage> {

  String? emailValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.blue[500],
        // actions: <Widget>[
        //   ElevatedButton(
        //   child:Image(
        //     image: AssetImage('images/editacc.png'),
        //     width: 25,
        //     height: 25,
        //   ),
        //   onPressed:(){
        //     Navigator.push(context,MaterialPageRoute(builder: (context)=>EditUserPage()));
        //   },
        // ),]
      ),
      body: Stack(
        children: <Widget>[
          FutureBuilder(
          future: fetchUsers(),
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    User user = snapshot.data![index];
                    getEmail();
                    if(user.email == emailValue)
                    {
                      return Padding(
                          padding: const EdgeInsets.all(15),
                        child: Column(
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
                            child:Text(
                              'Name : ${user.name}',
                              style: TextStyle(fontSize: 18, color:Colors.blueGrey[900]),
                          ),),),),
                        Card(
                          child:
                          Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child:
                          Text(
                            'Home address : ${user.address}',
                            style: TextStyle(fontSize: 18, color:Colors.blueGrey[900]),
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
                            'Phone number : ${user.phonenum}',
                            style: TextStyle(fontSize: 18, color:Colors.blueGrey[900]),
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
                            'Email : ${user.email}',
                            style: TextStyle(fontSize: 18, color:Colors.blueGrey[900]),
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
                            'Password : ${user.password}',
                            style: TextStyle(fontSize: 18, color:Colors.blueGrey[900]),
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
                            'Role : ${user.role}',
                            style: TextStyle(fontSize: 18, color:Colors.blueGrey[900]),
                          ),),),),
                        ],
                      ),
                      );
                    }return Text("Next", style: TextStyle(fontSize:1, color:Colors.white));
                  }
              );
            }return CircularProgressIndicator();
          },
        ),
        ],
      ),
    );
  }
  void getEmail() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    emailValue = pref.getString('emailData');
    setState((){

    });
  }
}

