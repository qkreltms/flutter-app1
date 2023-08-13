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
  WorldTime worldTime =
      WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');

  // TODO: Back으로 돌아왔을 때 다시 네트워크 통신 로직 실행시키려면 어떻게 해야될까? init이아니라 mount 같은 곳으로 이동시킨다. => 필요한지?
  // 링크 처럼 기능 구현해야 가능할 듯 함... https://stackoverflow.com/questions/51835039/how-do-i-check-if-the-flutter-application-is-in-the-foreground-or-not
  @override
  void initState() {
    super.initState();
    Future(() => worldTime.init()).then((value) {
      Navigator.pushReplacementNamed(context, '/location',
          arguments: WorldTime(
              location: worldTime.location,
              flag: worldTime.flag,
              url: worldTime.url,
              isDaytime: worldTime.isDaytime,
              time: worldTime.time));
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
