import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      "questionText": 'What\'s your favorite color?',
      "answer": [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 20},
        {'text': 'Green', 'score': 30},
        {'text': 'White', 'score': 40},
      ],
    },
    {
      "questionText": 'What\'s your favorite animal?',
      "answer": [
        {'text': 'Lion', 'score': 15},
        {'text': 'Panda', 'score': 25},
        {'text': 'Koala', 'score': 35},
        {'text': 'Tiger', 'score': 45},
      ],
    },
    {
      "questionText": 'What\'s your favorite friend?',
      "answer": [
        {'text': 'Gauri', 'score': 100},
        {'text': 'Kashish', 'score': 20},
        {'text': 'Shruti', 'score': 30},
        {'text': 'Shreya', 'score': 40},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print("No more questions!!");
      print("Total Score: $_totalScore");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: (int score) => _answerQuestion(score),
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore),
      ),
    );
  }
}
