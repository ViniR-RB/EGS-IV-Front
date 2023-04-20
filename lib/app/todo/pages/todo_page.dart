import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front/app/todo/datasource/datasource.dart';
import 'package:front/app/todo/repository/todo_repository.dart';
import 'package:front/app/todo/store/todo_store.dart';

import '../state/todo_state.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TodoStore _store =
      TodoStore(TodoRepositoryImpl(DioDataSourceImpl(Dio())));

  @override
  void initState() {
    _listerner();

    super.initState();
  }

  void _listerner() {
    _store
      ..fetchTodos()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container();
    if (_store.state is LoadingTodoState) {
      body = const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    } else if (_store.state is LoadedTodoState) {
      body = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              cacheExtent: 10,
              itemCount: _store.todo.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(_store.todo[index].title),
                  value: _store.todo[index].isCompleted,
                  onChanged: null,
                );
              },
            ),
          ),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Home')),
      body: body,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _listerner();
  }
}
