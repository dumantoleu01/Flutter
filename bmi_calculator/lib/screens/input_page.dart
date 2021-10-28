import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/card_content.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}
CalculatorBrain calculator = CalculatorBrain();

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                  color: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FAMALE',
                  ),
                  color: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            color: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      calculator.getHeight().toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
                  ),
                  child: Slider(
                    value: calculator.getHeight().toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        calculator.setHeight(newValue.round());
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColour,
                  cardChild: CardContent(
                    title: 'WEIGHT',
                    rate: calculator.getWeight(),
                    onPressedMinus: () {
                      setState(() {
                        calculator.decreaseWeight();
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        calculator.increasaWeight();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColour,
                  cardChild: CardContent(
                    title: 'AGE',
                    rate: calculator.getAge(),
                    onPressedMinus: () {
                      setState(() {
                        calculator.decreaseAge();
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        calculator.increasaAge();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomButton(
          onPress: () {
            calculator.calculateBMI();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmiResult: calculator.calculateBMI(),
                          bmiResultText: calculator.getResult(),
                          interpretation: calculator.getInterpretation(),
                        )));
          },
          buttonTitle: 'CALCULATE',
        ),
      ],
    );
  }
}
