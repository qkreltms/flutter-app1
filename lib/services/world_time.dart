import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location = '';
  String time = '';
  String flag = '';
  String url = 'Europe/London';
  bool isDaytime = false;

  WorldTime(
      {required this.location,
      required this.flag,
      required this.url,
      this.isDaytime = false,
      this.time = ''});

  init() async {
    try {
      var res = await get(Uri.https('worldtimeapi.org', '/api/timezone/$url'));
      Map data = jsonDecode(res.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].toString().substring(1, 3);
      DateTime now =
          DateTime.parse(datetime).add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (error) {
      print(error);
      time = 'could not get time data';
    }
  }
}
