import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  var location;

  var time;

  var flag;

  var url;

  var isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      var datetime = data['datetime'];
      var offsetInHour = data['utc_offset'].substring(1, 3);
      var offsetInMin = data['utc_offset'].substring(4, 6);
      // print(datetime);
      // print(offsetInHour);
      // print(offsetInMin);

      var now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offsetInHour), minutes: int.parse(offsetInMin)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

      //  print(now);
    } catch (e) {
      print('something is wrong :- $e');
      time = 'Error';
      isDayTime=true;
    }
  }
}
