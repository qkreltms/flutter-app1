import 'package:flutter/material.dart';
import 'package:my_app/models/todo_model.dart';
import 'package:provider/provider.dart';

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
    return Consumer<TodoModel>(
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
            ));
  }
}
