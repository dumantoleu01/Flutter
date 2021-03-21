import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int count;
  final int total;
  final Function onClearState;
  const Result({Key key, this.count, this.total, this.onClearState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String msg = '';
    Widget img;
    int correctPersantage = (count / total).round() * 100;

    if (0 <= correctPersantage && correctPersantage > 40) {
      msg = 'Bad, I can call you anime guy!';
      img = Image.asset('assets/images/anime_girl.jpg');
    } else if (40 <= correctPersantage && correctPersantage > 70) {
      msg = 'Not Bad,you are anime guy!';
      img = Image.asset('assets/images/anime_girl.jpg');
    } else {
      msg = 'Nice, You love anime like me!';
      img = Image.asset('assets/images/anime_girl.jpg');
    }

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 15,
              spreadRadius: 0,
              offset: Offset(2, 5),
            )
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(colors: [
            Color(0xFF5337ff),
            Color(0xFF8131ff),
            Color(0xFFbd27ff),
          ])),
      child: Column(
        children: <Widget>[
          Container(
            child: FittedBox(
              fit: BoxFit.contain,
              child: img,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Text(
            'Your score $count from $total',
            style: TextStyle(color: Colors.white),
          ),
          Divider(
            color: Colors.white,
          ),
          FlatButton(
              onPressed: onClearState,
              child: Text(
                'Again',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
