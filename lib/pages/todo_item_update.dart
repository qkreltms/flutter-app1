import 'package:flutter/material.dart';
import 'package:my_app/models/todo_model.dart';
import 'package:provider/provider.dart';

class TodoItemUpdatePage extends StatefulWidget {
  TodoItemUpdatePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TodoItemUpdatePageState();
  }
}

// TODO: form형식으로, validation까지, 전달되는 값이 있으면 수정, 없으면 추가
class _TodoItemUpdatePageState extends State<TodoItemUpdatePage> {
  // form이 이 키값이 있어야한다... 왤까?
  final _formKey = GlobalKey<FormState>();
  var todo;

  @override
  Widget build(BuildContext context) {
    todo = ModalRoute.of(context)?.settings.arguments ?? TodoItem(id: -1);

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text(todo.id != -1 ? "(${todo.id}) todo 업데이트" : "todo 추가")),
        body: Consumer<TodoModel>(
            builder: (context, todos, child) => SafeArea(
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          initialValue: todo.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            todo.text = value;
                            return null;
                          },
                        ),
                        FormField(
                          builder: (state) {
                            return Row(
                              children: <Widget>[
                                const Text('완료?'),
                                Checkbox(
                                    value: todo.isDone,
                                    onChanged: (value) {
                                      todo.isDone = value;
                                      // HACK: 이게 왜 필요?
                                      state.didChange(value);
                                    }),
                              ],
                            );
                          },
                          validator: (value) {
                            // DO SOMETHING... IF YOU WANT
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: ElevatedButton(
                              child: const Text('Submit'),
                              onPressed: () {
                                // 위의 validator가 합당한지 체크
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing...')));
                                  if (todo.id == -1) {
                                    todos.add(todo);
                                  } else {
                                    todos.update(todo);
                                  }
                                }
                              }),
                        )
                      ],
                    )))));
  }
}
