class Txt {
  String text;
  String op;
  String op1;
  String op2;
  String text1;
  String text2;
  List<String> ops = ['/', '*', '-', '+', '%'];

  Txt({this.text});

  getText() {
    if (text == null) {
      text = "0";
    }
    return text;
  }

  void setText(txt) {
    if (txt is int || txt == '.') {
      if (text == '0') {
        text = txt.toString();
      } else {
        if (op2 == '=') {
          text = txt.toString();
          op2 = null;
          text1 = null;
          text2 = null;
          op1 = null;
          op = null;
        } else if (op == null) {
          text += txt.toString();
        } else {
          text = txt.toString();
          op1 = op;
          op = null;
        }
      }
    } else if (txt == 'AC') {
      text = "0";
      text1 = null;
      text2 = null;
      op1 = null;
      op = null;
      op2 = null;
      print(text);
    } else if (ops.contains(txt)) {
      if (text1 == null) {
        print('1');
        text1 = text;
        op = txt;
      } else if (op1 == null) {
        print('2');
        op = txt;
      } else {
        print('3');
        text2 = text;
        equal();
        text1 = text;
        op = txt;
        text2 = null;
        op1 = null;
      }
    } else if (txt == '=') {
      if (op2 == null) {
        text2 = text;
        op2 = txt;
        equal();
        print('4');
        text1 = text;
      } else {
        text1 = text;
        equal();
        print('5');
      }
    }
  }

  void equal() {
    if (op1 == '/') {
      text = (double.parse(text1) / double.parse(text2)).toString();
    } else if (op1 == '*') {
      text = (double.parse(text1) * double.parse(text2)).toString();
    } else if (op1 == '+') {
      text = (double.parse(text1) + double.parse(text2)).toString();
    } else if (op1 == '-') {
      text = (double.parse(text1) - double.parse(text2)).toString();
    } else if (op1 == '%') {
      text = ((double.parse(text1) * double.parse(text2)) / 100).toString();
    }
    text1 = text;
  }
}
