import 'package:flutter/material.dart';

class ExerciseListScreen extends StatelessWidget {
  const ExerciseListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Welcome to APP'),
              Text('Which action do you want to do?'),
              RaisedButton(
                onPressed: () {},
                child: Text('Create exercise'),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Create routin'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
