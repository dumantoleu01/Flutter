import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime = true;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datatime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(data);
      //print(datatime);
      //print(offset);
      DateTime now = DateTime.parse(datatime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 15 ? true : false;
    } catch (e) {
      print('Error: $e');
      time = 'Could not find time';
    }
  }
}
