import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  void getData() async {
    // Response response =
    //     await get('https://jsonplaceholder.typicode.com/todos/1');
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['title']);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Page!'),
      ),
      body: Column(
        children: <Widget>[
          Icon(
            Icons.widgets,
            size: 50,
            color: Colors.blue,
          ),
          Center(
            child: RaisedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/chooseLocation');
              },
              icon: Icon(Icons.mail),
              label: Text('click me'),
              color: Colors.amber,
            ),
          ),
          IconButton(
            icon: Icon(Icons.alternate_email),
            onPressed: () {
              print('iconButton');
              Navigator.pushNamed(context, '/location');
            },
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
