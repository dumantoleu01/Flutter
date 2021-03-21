import 'package:flutter/material.dart';
import 'package:quiz_app/models/Question.dart';
import 'package:quiz_app/widget/answer.dart';
import 'package:quiz_app/widget/progress_bar.dart';
import 'package:quiz_app/widget/quiz.dart';
import 'package:quiz_app/widget/result.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final QuestionData data = QuestionData();
  int _countResult = 0;
  int _questionIndex = 0;

  List<Icon> _icons = [];

  void _clearState() => setState(() {
        _questionIndex = 0;
        _countResult = 0;
        _icons = [];
      });

  void _onChangeAnswer(bool isCorrect) => setState(() {
        if (isCorrect) {
          _icons.add(Icon(
            Icons.brightness_1,
            color: Color(0xFFbd27ff),
          ));
          _countResult++;
        } else {
          _icons.add(Icon(
            Icons.brightness_1,
            color: Colors.white,
          ));
        }
        _questionIndex++;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Anime',
            style: TextStyle(fontSize: 26),
          ),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              color: const Color(0xff2a375a),
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              )),
          child: Column(
            children: <Widget>[
              ProgressBar(
                icons: _icons,
                count: _questionIndex,
                total: data.questions.length,
              ),
              _questionIndex < data.questions.length
                  ? Quiz(
                      index: _questionIndex,
                      questionData: data,
                      onChangeAnswer: _onChangeAnswer,
                    )
                  : Result(
                      count: _countResult,
                      total: data.questions.length,
                      onClearState: _clearState,
                    )
            ],
          ),
        ));
  }
}
