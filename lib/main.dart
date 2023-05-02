import 'package:flutter/material.dart';
import 'package:flutter_course/answer.dart';
import 'package:flutter_course/question.dart';
import 'package:flutter_course/quiz.dart';
import 'package:flutter_course/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//Putting an underscore before the name of the class/variable makes it PRIVATE, so it can not be accesible from other files
class _MyAppState extends State<MyApp> {
  //state is a generic type, so State<MyApp> tells flutter that this state belongs to the MyApp class

  //const = compile time constant
  final _questions = const [
    {
      'questionText': "What's your favourite colour?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 6},
        {'text': 'Yellow', 'score': 1},
        {'text': 'Green', 'score': 3}
      ]
    },
    {
      'questionText': "What's your favourite animal?",
      'answers': [
        {'text': 'Lion', 'score': 8},
        {'text': 'Dog', 'score': 1},
        {'text': 'Tiger', 'score': 6},
        {'text': 'Seal', 'score': 3}
      ]
    }
  ];

  /*========Example code=========
    // podemos tener una variable con valor constante
    var dummy = const ['Hello'];
    dummy.add('Max'); //esto no funciona porque no se puede modificar el valor de la variable, ya que el mismo es constante
    dummy = []; //esto si funciona ya que estamos sobreescribiendo el valor de la variable con uno nuevo, y la variable no es constante
    */
  var _questionIndex = 0;
  //All classes should work standalone, so everything that belong to a widget should go into the same class
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    //we have to tell flutter that we re about to change the state
    //and then when the state is changed it should re render this widget
    setState(() {
      //set state forces flutter to re render user interface (UI) | not the entire UI of the entire app
      //it calls build method of the widget where the setState is located
      _questionIndex = _questionIndex + 1;
    });
    print('question answered!');
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ), //scaffold nos da una ui base
    );
  }
}
