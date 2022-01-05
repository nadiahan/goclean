import 'package:flutter/material.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({Key? key}) : super(key: key);

  @override
  _EditUserPage createState() => _EditUserPage();
}

class _EditUserPage extends State<EditUserPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Go Clean'),
          backgroundColor: Colors.blue[500],
        )
    );
  }
}