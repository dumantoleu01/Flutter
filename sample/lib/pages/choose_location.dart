import 'package:flutter/material.dart';
import 'package:sample/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Anime', flag: '1.jpg', url: 'Asia/Almaty'),
    WorldTime(location: 'Almaty', flag: 'kazakhstan.jpg', url: 'Asia/Almaty'),
    WorldTime(location: 'Almaty', flag: 'kazakhstan.jpg', url: 'Asia/Almaty'),
    WorldTime(location: 'Almaty', flag: 'kazakhstan.jpg', url: 'Asia/Almaty'),
    WorldTime(location: 'Almaty', flag: 'kazakhstan.jpg', url: 'Asia/Almaty'),
    WorldTime(location: 'Almaty', flag: 'kazakhstan.jpg', url: 'Asia/Almaty'),
  ];

  void getTime(WorldTime worldTime) async {
    await worldTime.getTime();

    Navigator.pop(context, {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ChooseLocation'),
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  getTime(locations[index]);
                },
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
                title: Text(locations[index].location),
              ),
            );
          },
        ));
  }
}
