import 'package:flutter/foundation.dart';

class Question {
  final String title;
  final List<Map> answers;

  Question({
    @required this.title,
    @required this.answers,
  });
}

class QuestionData {
  final _data = [
    Question(title: '..... Caviar in the fridge.', answers: [
      {
        'answer': 'There is not no  ',
      },
      {
        'answer': 'There is any',
      },
      {'answer': 'There is not any', 'isCorrect': 1},
      {
        'answer': 'There are not no',
      },
    ]),
    Question(title: 'He goes to his guitar lessons....', answers: [
      {'answer': 'by underground', 'isCorrect': 1},
      {
        'answer': 'on underground  ',
      },
      {
        'answer': 'with underground',
      },
      {
        'answer': 'in underground',
      },
    ]),
    Question(title: 'David is the boss, you need to speak to ...', answers: [
      {
        'answer': 'it',
      },
      {'answer': 'him', 'isCorrect': 1},
      {
        'answer': 'her',
      },
      {
        'answer': 'them',
      },
    ]),
    Question(title: 'She ... Supper with us last Friday', answers: [
      {
        'answer': 'had not',
      },
      {
        'answer': 'no had',
      },
      {
        'answer': 'did not have got',
      },
      {'answer': 'did not have', 'isCorrect': 1},
    ]),
  ];

  List<Question> get questions => [..._data];
}
