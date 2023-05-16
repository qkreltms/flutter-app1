import 'package:flutter/material.dart';
import 'package:my_app/pages/change-location.dart';
import 'package:my_app/pages/loading.dart';
import 'package:my_app/pages/location.dart';

void main() {
  return runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/change-location': (context) => ChangeLocation(),
      '/location': (context) => Location(),
    },
  ));
}
