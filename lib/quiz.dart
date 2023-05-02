import 'package:flutter/material.dart';

import 'package:flutter_course/answer.dart';
import 'package:flutter_course/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz(
      {Key key,
      @required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[questionIndex]['questionText']),
      ...((questions[questionIndex]['answers'] as List<Map<String, Object>>)
          .map((answer) {
        return Answer(() => answerQuestion(answer['score']), answer['text']);
        //con () => creamos una funcion anonima 'on the fly' y a Answer le estamos pasando automaticamente la direccion en memoria de esa funcion
      })).toList() //esto lo que hace es llenas una lista nueva con los items de la lista de adentro, y no generar una nested list que es lo que pasaria si no lo agregasemos
      //en onPressed debemos pasarle un puntero de la funcion y no la ejecucion de la funcion como tal, para eso sacamos los parentesis
      //ElevatedButton(onPressed: answerQuestion, child: Text('Answer 1')),
      //anonymus functions se les llama a las que se definen mismo en el onPressed
      /*ElevatedButton(
              onPressed: () {
                //...
                print('Answer 3');
                //si en funciones de este tipo agregamos () luego de la ultima llave, la funcion se ejecuta al momento de renderizado de la app
              },
              child: Text('Answer 3'))*/
    ]);
  }
}
