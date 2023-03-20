import 'package:front/app/todo/adapter/todo_adapter.dart';
import 'package:front/app/todo/datasource/datasource.dart';
import 'package:front/app/todo/model/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> fetchTodos();
}

class TodoRepositoryImpl implements TodoRepository {
  final DataSource _dataSource;

  TodoRepositoryImpl(this._dataSource);

  @override
  Future<List<TodoModel>> fetchTodos() async {
    final response = await _dataSource.fetchTodo();
    final todo = response.map(TodoAdapter.toModel).toList();
    return todo;
  }
}
