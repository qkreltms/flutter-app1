import 'package:flutter/material.dart';
import 'package:my_app/services/world_time.dart';

// changelocation 추가, 삭제
// global state 다루는 법

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LocationState();
  }
}

class _LocationState extends State<Location> {
  var data;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    data = data ?? ModalRoute.of(context)?.settings.arguments as WorldTime?;
    var location = data?.location ?? '';
    var time = data?.time ?? '';
    var isDaytime = data?.isDaytime ?? false;
    var bgImage = '${isDaytime ? 'day' : 'night'}.png';
    var appBarColor = isDaytime ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: appBarColor,
      body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  // ignore: unnecessary_brace_in_string_interps
                  image: DecorationImage(
                      image: AssetImage('assets/${bgImage}'),
                      fit: BoxFit.cover)),
              child: Column(
                children: <Widget>[
                  IconButton(
                      tooltip: 'Choose location',
                      onPressed: () async {
                        // change-location에서 pop 함수와 같이 전달된 데이터가 아래로 온다.
                        WorldTime res = await Navigator.pushNamed(
                            context, '/change-location') as WorldTime;
                        setState(() {
                          data = res;
                        });
                      },
                      icon: const Icon(Icons.edit_location)),
                  // 빈공간 넣기
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(location),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 80),
                  )
                ],
              ))),
    );
  }
}
