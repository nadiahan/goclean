import 'package:flutter/material.dart';
import 'package:goclean/customer_history_1.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'custMain.dart';
import 'mngrMain.dart';
import 'dvrMain.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_session/flutter_session.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  dynamic tokenCus = await FlutterSession().get('tokenC');
  dynamic tokenMan = await FlutterSession().get('tokenM');
  dynamic tokenDel = await FlutterSession().get('tokenD');

  if(tokenCus==''&&tokenMan==''&&tokenDel==''){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()
  ));}
  else if(tokenMan!=''){
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ManagerMenu()
    ));}
  else if(tokenDel!=''){
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DMenuPage()
    ));}
  else{
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CMenuPage()
    ));}
}

class MyApp extends StatefulWidget {
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  final _formKey = GlobalKey<FormState>();
  late String txtemail, txtpassword;
  late String userId;

  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();



  Future _login() async{
    var response = await http.post(Uri.parse("http://goclean5yeoja.com/login.php"), body:{
      "email":email.text,
      "password":pass.text,
    });
    var data = json.decode(response.body);

    userId = data[0]['id'];
    setId(userId);
    setEmail(email.text);

    if(data[0]['role']=="Customer"){

      await FlutterSession().set('tokenC',email.text);

      Fluttertoast.showToast(
          msg: "Login successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.green,
          fontSize: 16
      );
      Navigator.push(context,MaterialPageRoute(builder: (context)=> CMenuPage()));
    }else if(data[0]['role']=="Manager"){
      await FlutterSession().set('tokenM',email.text);
      Fluttertoast.showToast(
          msg: "Login successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.green,
          fontSize: 16
      );
      Navigator.push(context,MaterialPageRoute(builder: (context)=> ManagerMenu()));
    }else if(data[0]['role']=="Deliveryman"){
      await FlutterSession().set('tokenD',email.text);
      Fluttertoast.showToast(
          msg: "Login successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.green,
          fontSize: 16
      );
      Navigator.push(context,MaterialPageRoute(builder: (context)=> DMenuPage()));
    }else{
      Fluttertoast.showToast(
          msg: "User credentials incorrect!",
          toastLength: Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.red,
          fontSize: 16
      );
    }
  }
  Future<void> setEmail(emailValue) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('emailData', emailValue);
  }
  Future<void> setId(idValue) async{
    final SharedPreferences prefId = await SharedPreferences.getInstance();
    prefId.setString('idData', idValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Go Clean'),
        backgroundColor: Colors.blue[500],
          automaticallyImplyLeading: false
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
                  child: Text("Welcome!", style: TextStyle(
                      fontSize: 30,
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
                image: AssetImage('images/gcicon.png'),
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
                height:190,
                width: 300,
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child:Column(
                      children: <Widget>[
                        //email
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(labelText:'Email'),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value){
                            txtemail = value!;
                          },
                          validator: validateEmail,
                        ),
                        TextFormField(
                          controller: pass,
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          onSaved: (value){
                            txtpassword = value!;
                          },
                          validator: validatePassword,
                        ),
                        SizedBox(
                          height:30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
              Padding(
                padding: EdgeInsets.only(top:25),
                child: ElevatedButton(
                  child: Text(
                      'Login'
                  ),
                  onPressed:_login,
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue[500],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: Text("Create a new account"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 90),
                child: Text("Icons made by Freepik from Flaticon", style: TextStyle(color: Colors.blueGrey)),
              ),
        ],
        ),

       ),

      ],
      ),
    );
  }

  String? validateEmail(String? email) {
    if(email!.isEmpty){
      return "Enter email address";
    }
    else{
      return null;
    }
  }

  String? validatePassword(String? password) {
    if(password!.isEmpty){
      return "Enter password";
    }
    else{
      return null;
    }
  }
}
