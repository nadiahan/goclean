import 'dart:math';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class RatingView extends StatefulWidget {
  const RatingView({ Key? key}) : super(key: key);


  @override
  _RatingViewState createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {

  late String comment;
  final commentController = new TextEditingController();
  var _starPosition = 200.0;
  late var _rating = 0;
  var _ratingPageController = PageController();
  var ratingController = new TextEditingController();
  var _selectedChipIndex = -1;
  var _isMoreDetailActive = false;
  var _moreDetailFocusNode = FocusNode();
  bool visible = false ;


  void userSubmit() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String comment = commentController.text;
    var _rating = ratingController.text;
    var url = 'http://goclean5yeoja.com/customer_rating.php';

    var data = {'comment':comment,'_rating':_rating,};
    // Starting Web API Call.
    var response = await http.post(Uri.parse(url),body:json.encode(data));
    // Getting Server response into variable.
    var message = jsonDecode(response.body);
    // If Web call Success than Hide the CircularProgressIndicator.


    showDialog(
      context:context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          //Thanks note
          Container(
            height: max(300, MediaQuery.of(context).size.height*0.3),
            child: PageView(
              controller: _ratingPageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildThanksNote(),
                _causeOfRating(),
              ],
            ),
          ),
          //Done button
          Positioned(
            bottom: 2,
            left: 2,
            right: 2,
            child: Container(
              color: Colors.lightBlue,
              child: RaisedButton(
                onPressed: (){
                  userSubmit();
                  Navigator.pop(context);
                  _hideDialog();
                },
                child: Text('Submit'),
                textColor: Colors.white,
                color: Colors.lightBlue,
                focusColor: Colors.blue,
              ),


            ),
          ),
          //Skip button
          Positioned(
            right: 0,
            child: MaterialButton(
              onPressed:_hideDialog,
              child: Text('Skip'),
            ),
          ),
          //Star Rating
          AnimatedPositioned(
            top: _starPosition,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) => IconButton(
                  icon: index < _rating ? Icon(Icons.star, size: 32) : Icon(Icons.star_border, size: 32),
                  color: Colors.blue,
                  onPressed: (){
                    _ratingPageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                    setState(() {
                      _starPosition = 20.0;
                      _rating = index + 1;
                      ratingController = new TextEditingController(text: _rating.toString());
                    });
                  },
                ),
              ),
            ),
            duration: Duration(milliseconds: 300),
          ),
          //Back button
          if(_isMoreDetailActive)
            Positioned(
              left: 0,
              top: 0,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    _isMoreDetailActive = false;
                  });
                },
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
        ],
      ),
    );
  }

  _buildThanksNote(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Enjoy Go Clean?',
          style: TextStyle(
            fontSize: 18,
            color: Colors.lightBlue,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        Text('Tap the star to rate:'),
        Text('How was our laundry service today?'),
      ],
    );
  }


  _causeOfRating(){
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: !_isMoreDetailActive,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Dissatisfied?'),
              //Cause selection
              Wrap(
                spacing: 8.0,
                alignment: WrapAlignment.center,
                children: List.generate(
                  1,
                      (index) => InkWell(
                    onTap: (){
                      setState(() {
                        _selectedChipIndex = index;
                      });
                    },
                    child: Chip(
                      backgroundColor: _selectedChipIndex == index ? Colors.blue : Colors.lightBlueAccent[300],
                      label: Text('Yes, I am dissatisfied'),
                    ),),
                ),
              ),

              SizedBox(height: 16),
              //More button
              InkWell(
                onTap: (){
                  _moreDetailFocusNode.requestFocus();
                  setState(() {
                    _isMoreDetailActive = true;
                  });
                },
                child: Text(
                  'Want to tell us more?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          replacement:Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Tell us more'),
              Chip(label: Text('I am dissatisfied because...')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: commentController,
                  focusNode: _moreDetailFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Write your review here...',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }



  _hideDialog(){
    if(Navigator.canPop(context))Navigator.pop(context);
  }

}