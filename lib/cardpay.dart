// import 'package:flutter/material.dart';
//
// class CardPayPage extends StatefulWidget {
//   const CardPayPage({Key? key}) : super(key: key);
//
//   @override
//   _CardPayPage createState() => _CardPayPage();
// }
//
// class _CardPayPage extends State<CardPayPage> {
//
//   void _payCard(){
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: Text('Go Clean'),
//     backgroundColor: Colors.blue[500],
//     ),
//       body: Stack(
//         children: <Widget>[
//       Container(
//       decoration: BoxDecoration(
//         color: Colors.blue[50],
//       ),
//     ),
//           Center(
//           child:  Card(
//           shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Container(
//           width: 300,
//           padding: EdgeInsets.all(10),
//           child:Column(
//           children: <Widget>[
//           ElevatedButton(
//           style: ElevatedButton.styleFrom(
//           primary: Colors.blue[500], // background
//           onPrimary: Colors.white, // foreground
//           fixedSize: Size.fromWidth(250)
//           ),
//           onPressed: _payCard,
//           child: Icon(Icons.payment)
//     ),
//   ]
//  )
//     )
//     )
//     )
//     ]
//     )
//     );
//   }
// }