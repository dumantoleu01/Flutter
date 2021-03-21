import 'package:flutter/material.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final index;
  final questionData;
  final onChangeAnswer;
  const Quiz({Key key, this.index, this.questionData, this.onChangeAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              questionData.questions[index].title,
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ),
          ...questionData.questions[index].answers
              .map((v) => Answer(
                    title: v['answer'],
                    onChangeAnswer: onChangeAnswer,
                    isCorrect: v.containsKey('isCorrect') ? true : false,
                  ))
              .toList(),
        ],
      ),
    );
  }
}
