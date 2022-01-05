import 'package:flutter/material.dart';
import 'rating_view.dart';

class AboutUsPage extends StatelessWidget{
  const AboutUsPage({ Key? key }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              Spacer(flex:1),
              Image(
                image: AssetImage('images/gcicon.png'),
                width: 100,
                height: 100,
              ),
              Text(
                'GoClean App',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              Spacer(flex:1),

              Text('Rate your experience',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center),
              Spacer(flex:1),

              Text('Rate the service to help others find the best laundry experiences.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16)
              ),
              Spacer(flex:1),
              Image(
                  image: NetworkImage('https://www.freepnglogos.com/uploads/star-png/star-vector-png-transparent-image-pngpix-21.png'),
                  width: 100,
                  height: 100
              ),
              Spacer(flex:1),

              Text('Your feedback makes a big differences!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16)
              ),
              Spacer(flex:2),
              TextButton.icon(
                onPressed: () {
                  openRatingDiaglog(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blue.withOpacity(0.1),
                  ),
                ),
                icon: Icon(Icons.star),
                label: Text(
                  'Rate us!',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  openRatingDiaglog(BuildContext context)
  {
    showDialog(
      context: context,
      builder: (context){
        return Dialog(
          child: RatingView(),
        );
      },
    );
  }
}