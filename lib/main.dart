import 'package:flutter/material.dart';
import 'package:my_app/models/cart_model.dart';
import 'package:my_app/models/todo_model.dart';
import 'package:my_app/pages/change_location.dart';
import 'package:my_app/pages/loading.dart';
import 'package:my_app/pages/location.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/pages/todo_item_update.dart';
import 'package:my_app/pages/todo_list.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

void main() {
  CartModel test = CartModel();
  TodoModel todo = TodoModel();
  return runApp(GetMaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/change-location': (context) =>
          // .value: 모델 값을 재사용할 수 있다.
          ChangeNotifierProvider.value(
              value: test, child: const ChangeLocation()),
      '/location': (context) =>
          ChangeNotifierProvider.value(value: test, child: const Location()),
      // value 공급 좀더 간결히 하는 방법 없을까?, 여러개 공급하려면 어떻게?
      '/todo-list': (context) => ChangeNotifierProvider.value(
          value: todo, child: const TodoListComponent()),
      '/todo-edit': (context) =>
          ChangeNotifierProvider.value(value: todo, child: TodoItemUpdatePage()),
      '/login': (context) =>
          ChangeNotifierProvider.value(value: todo, child: Login())
    },
  ));
}
