import 'package:calculator2/functions/text.dart';

class Functions {
  String clicked;

  Functions({this.clicked});

  void onClicked(text) {
    Txt txt = Txt();
    txt.setText(text);
  }
}
