import 'package:flutter_test/flutter_test.dart';
import 'package:front/app/todo/datasource/datasource.dart';
import 'package:front/app/todo/model/todo_model.dart';
import 'package:front/app/todo/repository/todo_repository.dart';
import 'package:mocktail/mocktail.dart';

class DataSourceMock extends Mock implements DataSource {}

void main() {
  late TodoRepository repository;
  late DataSource dataSource;

  setUp(() {
    dataSource = DataSourceMock();
    repository = TodoRepositoryImpl(dataSource);
  });
  test('Repository should return List TodoModel', () async {
    when(() => dataSource.fetchTodo()).thenAnswer((_) async => jsonResponse);
    final result = await repository.fetchTodos();

    expect(result, isA<List<TodoModel>>());
  });
}

List<dynamic> jsonResponse = [
  {'id': 1, 'title': 'Lore dsuan', 'isCompleted': true}
];
