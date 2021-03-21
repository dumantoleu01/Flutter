import 'package:calculator2/functions/functions.dart';
import 'package:calculator2/functions/text.dart';
import 'package:calculator2/sizes/sizes_helpers.dart';
import 'package:calculator2/widgets/button.dart';
import 'package:calculator2/widgets/buttons_column.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  String text = "";
  Txt txt = Txt();
  Functions functions = Functions();

  List<List> buttons = [
    ['AC', '&', '%', '/'],
    [7, 8, 9, '*'],
    [4, 5, 6, '-'],
    [1, 2, 3, '+'],
    [0, '.', '=']
  ];

  void onClicked(btn) {
    setState(() {
      txt.setText(btn);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('HomePage');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        txt.getText(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: displayWidth(context) * 0.2,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ...buttons
                        .map((column) => ButtonsColumn(
                              column: column,
                              index: index,
                              onClicked: onClicked,
                            ))
                        .toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
