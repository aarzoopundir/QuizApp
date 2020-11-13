import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import './quiz.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions=const[
    {'questionText':'Which is the most expensive country in the world?',
      'answers':[{'text':'US','score':0},
        {'text':'Norway','score':0},
        {'text':'Switzerland','score':10},
        {'text':'Denmark','score':0}
  ],
    },
    {'questionText':'In what country are the world’s ten coldest cities located?',
      'answers':[{'text':'Russia','score':10},
        {'text':'US','score':0},
        {'text':'Australia','score':0},
        {'text':'Greenland','score':0}
        ],
    },
    {'questionText':'Which is the world\'s second largest country ?',
      'answers':[{'text':'Russia','score':0},
        {'text':'India','score':0},
        {'text':'China','score':0},
        {'text':'Canada','score':10}
        ],
    },
  ];
  var _questionIndex=0;
  var _totalScore=0;
  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });
  }
  void _answerQuestion(int score){
    _totalScore+=score;
    setState(() {
      _questionIndex=_questionIndex+1;
    });
    if(_questionIndex < _questions.length){
      print("we have more questions");
    }
    else{
      print('no more questions!');
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Country Quiz App')),
      ),
      body: _questionIndex < _questions.length ?
          Quiz(
            answerQuestion:_answerQuestion,
            questionIndex:_questionIndex,
            questions:_questions
          ):Result(_totalScore,_resetQuiz),
    );
  }
}