import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoadingState();
  }
}

class _LoadingState extends State<Loading> {
  String time = 'Loading...';

  // TODO: Back으로 돌아왔을 때 다시 네트워크 통신 로직 실행시키려면 어떻게 해야될까?
  @override
  void initState() {
    super.initState();
    WorldTime worldTime = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    Future(() => worldTime.getTime()).then((value) {
      Navigator.pushReplacementNamed(context, '/location',
          arguments: WorldTime(
              location: worldTime.location,
              flag: worldTime.flag,
              url: worldTime.url,
              isDaytime: worldTime.isDaytime,
              time: value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitWaveSpinner(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
