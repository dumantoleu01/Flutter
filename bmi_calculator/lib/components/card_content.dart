import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardContent extends StatelessWidget {
  final String title;
  final int rate;
  final Function onPressedMinus;
  final Function onPressedPlus;

  const CardContent({
    Key key,
    this.title,
    this.rate,
    this.onPressedMinus,
    this.onPressedPlus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: kLabelTextStyle,
        ),
        Text(
          rate.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
                icon: FontAwesomeIcons.minus, onPressed: onPressedMinus),
            SizedBox(width: 10),
            RoundIconButton(
                icon: FontAwesomeIcons.plus, onPressed: onPressedPlus),
          ],
        ),
      ],
    );
  }
}
