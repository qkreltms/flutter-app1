import 'package:flutter/material.dart';
import 'package:my_app/models/cart_model.dart';
import 'package:my_app/pages/change_location.dart';
import 'package:my_app/pages/loading.dart';
import 'package:my_app/pages/location.dart';
import 'package:provider/provider.dart';

void main() {
  CartModel test = CartModel();
  return runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/change-location': (context) =>
          // .value: 모델 값을 재사용할 수 있다.
          ChangeNotifierProvider.value(
              value: test, child: const ChangeLocation()),
      '/location': (context) =>
          ChangeNotifierProvider.value(value: test, child: const Location()),
    },
  ));
}
