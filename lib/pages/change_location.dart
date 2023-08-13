import 'package:flutter/material.dart';
import 'package:my_app/models/cart_model.dart';
import 'package:my_app/services/world_time.dart';
import 'package:provider/provider.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChangeLocationState();
  }
}

class _ChangeLocationState extends State<ChangeLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: '', url: 'Europe/London'),
    WorldTime(location: 'German', flag: '', url: 'Europe/Berlin'),
    WorldTime(location: 'Seoul', flag: '', url: 'Asia/Seoul'),
  ];

  onTap(BuildContext context, int index) async {
    WorldTime worldTime = locations[index];
    await worldTime.init();
    if (context.mounted) Navigator.pop(context, worldTime);
  }

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments;
    var cart = context.read<CartModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('choose location'),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                      onTap: () {
                        onTap(context, index);
                      },
                      title: Text(
                          '${locations[index].location}${cart.count()} ')));
            }),
      ),
    );
  }
}
