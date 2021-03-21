import 'package:flutter/material.dart';
import 'package:sample/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String time = 'loading...';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Almaty', flag: 'kazakstan.jpg', url: 'Asia/Almaty');

    await instance.getTime();
    setState(() {
      time = instance.time;
    });
    Navigator.pushNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    print('Helloooooooooooooooooooooo');
    return Scaffold(
      appBar: AppBar(
        title: Text('Boxes'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Duman Toleu'),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(30),
                  child: Text("1"),
                  color: Colors.amber,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(30),
                  child: Text("2"),
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(30),
                  child: Text("3"),
                  color: Colors.green,
                ),
              ),
            ],
          ),
          RaisedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.home),
            label: Text('Home Page!'),
          ),
          Text(time),
        ],
      ),
    );
  }
}
