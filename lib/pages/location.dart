import 'package:flutter/material.dart';
import 'package:my_app/models/cart_model.dart';
import 'package:my_app/pages/location/icon_button.dart';
import 'package:my_app/services/world_time.dart';
import 'package:provider/provider.dart';

// TODO: changelocation 추가, 삭제
// DONE: global state 다루는 법

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
      body: Consumer<CartModel>(
          builder: (context, cart, child) => SafeArea(
              child: Container(
                  decoration: BoxDecoration(
                      // ignore: unnecessary_brace_in_string_interps
                      image: DecorationImage(
                          image: AssetImage('assets/$bgImage'),
                          fit: BoxFit.cover)),
                  child: Column(
                    children: <Widget>[
                      MyIconButton(setData: (WorldTime res) {
                        setState(() {
                          data = res;
                        });
                      }),
                      IconButton(
                          style: const ButtonStyle(
                              // HACK: 버튼 사이즈 안바뀌는데?
                              iconSize: MaterialStatePropertyAll(50)),
                          icon: const Icon(Icons.list),
                          onPressed: () async {
                            await Navigator.pushNamed(context, '/todo-list');
                          }),
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
                      ),
                      Text(cart.count()),
                      OutlinedButton(
                          onPressed: () {
                            cart.increase();
                          },
                          child: const Text('Increase')),
                      OutlinedButton(
                          onPressed: () {
                            cart.decrease();
                          },
                          child: const Text('Decrease')),
                    ],
                  )))),
    );
  }
}
