import 'package:flutter/material.dart';
import 'package:my_app/models/todo_model.dart';
import 'package:provider/provider.dart';

// TODO: 투두리스트로 접근할 수 있는 글로벌 네비게이션 만들기
class TodoListComponent extends StatefulWidget {
  const TodoListComponent({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TodoListState();
  }
}

class _TodoListState extends State<TodoListComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('choose location'),
          elevation: 0,
        ),
        body: Consumer<TodoModel>(
            builder: (context, todos, child) => SafeArea(
                  child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return TodoItemComponent(
                        todo: todos.items[index],
                      );
                    },
                  ),
                )));
  }
}

class TodoItemComponent extends StatefulWidget {
  TodoItem todo = TodoItem(id: -1);
  TodoItemComponent({super.key, required this.todo});

  @override
  State<StatefulWidget> createState() {
    return _TodoItemState();
  }
}

class _TodoItemState extends State<TodoItemComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<TodoModel>(
            builder: (context, todos, child) => Row(
                  // 이런식으로 프로퍼티 받을 수 있음 widget (프로퍼티 상속)
                  children: [
                    Checkbox(
                        value: widget.todo.isDone,
                        onChanged: (value) {
                          todos.done(widget.todo);
                        }),
                    Text(widget.todo.text),
                  ],
                )));
  }
}
