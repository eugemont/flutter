import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //final = runtime constant value
  // with final it will not change once it has its initial data
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double
          .infinity, //with this the container takes the full with of the screen
      //and the text automatically takes the full width of the container
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
