import 'package:flutter/material.dart';
import 'package:front/app/todo/repository/todo_repository.dart';
import 'package:front/app/todo/state/todo_state.dart';

import '../model/todo_model.dart';

class TodoStore extends ChangeNotifier {
  final TodoRepository _repository;
  TodoState _state = LoadedTodoState();
  List<TodoModel> _todo = [];

  List<TodoModel> get todo => _todo;
  TodoState get state => _state;

  TodoStore(this._repository);

  void _emit(TodoState status) {
    _state = status;
    notifyListeners();
  }

  Future<void> fetchTodos() async {
    _emit(LoadingTodoState());
    _todo = await _repository.fetchTodos();
    _emit(LoadedTodoState());
  }

  Future<void> postTodos(String title) async {
    await _repository.postTodos(title);
    await fetchTodos();
  }
}
