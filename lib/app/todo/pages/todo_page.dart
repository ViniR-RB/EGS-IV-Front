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
  late TodoState _state = _store.state;

  @override
  void initState() {
    _listerner();

    super.initState();
  }

  _listerner() {
    _store.fetchTodos();

    _store.addListener(() {
      print(_state);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _body = Container();
    if (_store.state is LoadingTodoState) {
      _body = const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    } else if (_store.state is LoadedTodoState) {
      _body = ListView.builder(
          itemCount: _store.todo.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
                title: Text(_store.todo[index].title),
                value: _store.todo[index].isCompleted,
                onChanged: null);
          });
    }
    return Scaffold(
      appBar: AppBar(title: Text('Todo Home')),
      body: _body,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _listerner();
  }
}
