import 'package:calculator2/sizes/sizes_helpers.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final button;
  final Function onClicked;

  const Button({Key key, this.button, this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Color(0xFFFF9500);
    if (['AC', '&', '%'].contains(button)) {
      color = Color(0xFFD4D4D2);
    } else if (button is int || ["."].contains(button)) {
      color = Color(0xFF505050);
    } else {
      color = Color(0xFFFF9500);
    }
    return Container(
      child: Expanded(
        child: Container(
          height: displayHeight(context) * (0.4 / 3),
          padding: EdgeInsets.all(5),
          child: FlatButton(
            shape: CircleBorder(
              side: BorderSide.none,
            ),
            onPressed: () {
              onClicked(button);
            },
            child: Text(
              '$button',
              style: TextStyle(
                color: ['AC', '&', '%'].contains(button)
                    ? Colors.black
                    : Colors.white,
                fontSize: (button == 'AC')
                    ? displayWidth(context) * 0.09
                    : displayWidth(context) * 0.1,
              ),
            ),
            color: color,
          ),
        ),
      ),
    );
  }
}
