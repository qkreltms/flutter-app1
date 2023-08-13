import 'package:flutter/material.dart';
import 'package:my_app/components/todo_item.dart';
import 'package:my_app/models/todo_model.dart';
import 'package:provider/provider.dart';

// TODO: 투두리스트로 접근할 수 있는 글로벌 바텀 네비게이션 만들기
// TODO: 네비게이션 Stack 형식으로 수정
// => Go Router로 가능: https://stackoverflow.com/questions/71011598/how-to-work-with-navigationbar-in-go-router-flutter
// shell을 navigation 위에 얹고 그 위에서 라우팅 하는 방식

// 리팩토링
class TodoListComponent extends StatefulWidget {
  const TodoListComponent({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TodoListState();
  }
}

class _TodoListState extends State<TodoListComponent> {
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Todo List'),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/todo-edit', arguments: null);
          },
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
