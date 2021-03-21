import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    Color bgColor = data['isDayTime'] ? Colors.red : Colors.blue;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Duman'),
            Text(data['time']),
          ],
        ),
        backgroundColor: bgColor,
      ),
      body: ListView(children: <Widget>[
        Container(
          child: Center(
            child: Text(
              "Duman Toleu!",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'IndieFlower',
                letterSpacing: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Image(
          image: AssetImage('assets/2.jpg'),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic result =
              await Navigator.pushNamed(context, '/chooseLocation');
          setState(() {
            data = {
              'location': result['location'],
              'flag': result['flag'],
              'time': result['time'],
              'isDayTime': result['isDayTime'],
            };
          });
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}
