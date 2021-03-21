import 'package:calculator2/sizes/sizes_helpers.dart';
import 'package:calculator2/widgets/button.dart';
import 'package:flutter/material.dart';

class ButtonsColumn extends StatelessWidget {
  final List column;
  final index;
  final onClicked;

  const ButtonsColumn({Key key, this.column, this.index, this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ...column
            .map((btn) => Button(
                  button: btn,
                  onClicked: onClicked,
                ))
            .toList(),
      ],
    );
  }
}
