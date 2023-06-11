import 'dart:collection';

import 'package:flutter/widgets.dart';

class TodoItem {
  int id;
  String text = '';
  bool isDone = false;

  TodoItem({
    required this.id,
    this.text = '',
    this.isDone = false,
  });
}

// 아래형식은 글로벌 프로바이더
// 로컬 state로 하는 방식은 다름
class TodoModel extends ChangeNotifier {
  List<TodoItem> _items = [TodoItem(id: 1, text: 'test', isDone: true)];

  UnmodifiableListView<TodoItem> get items => UnmodifiableListView(_items);

  void add(TodoItem item) {
    int id = _items[_items.length - 1].id + 1;
    _items.add(TodoItem(id: id, text: item.text, isDone: item.isDone));
    notifyListeners();
  }

  void remove(TodoItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void update(TodoItem item) {
    _items = _items.map((e) {
      if (e.id == item.id) {
        return item;
      }
      return e;
    }).toList();
    notifyListeners();
  }

  void done(TodoItem item) {
    _items = _items.map((e) {
      if (e.id == item.id) {
        e.isDone = !e.isDone;
      }
      return e;
    }).toList();
    notifyListeners();
  }

  int get length {
    return _items.length;
  }

  void fillText(TodoItem item, String text) {
    _items.map((e) {
      if (e.id == item.id) {
        e.text = text;
      }
      return e;
    });
    notifyListeners();
  }
}
