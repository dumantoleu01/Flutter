import 'dart:math';

class CalculatorBrain {
  int _height = 177;
  int _weight = 60;
  int _age = 21;

  double _bmi;
  int getHeight() {
    return _height;
  }

  int getWeight() {
    return _weight;
  }

  int getAge() {
    return _age;
  }

  void setHeight(int h) {
    _height = h;
  }

  void increasaWeight() {
    _weight++;
  }

  void decreaseWeight() {
    _weight--;
  }

  void increasaAge() {
    _age++;
  }

  void decreaseAge() {
    _age--;
  }

  String calculateBMI() {
    _bmi = _weight / pow(_height / 100, 2);
    _bmi = (_bmi * 10).round() / 10;
    return _bmi.toString();
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  void getBMI() {
    print(_bmi);
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
