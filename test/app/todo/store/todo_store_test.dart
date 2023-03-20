import 'package:flutter_test/flutter_test.dart';
import 'package:front/app/todo/model/todo_model.dart';
import 'package:front/app/todo/repository/todo_repository.dart';
import 'package:front/app/todo/state/todo_state.dart';
import 'package:front/app/todo/store/todo_store.dart';
import 'package:mocktail/mocktail.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

void main() {
  late TodoRepository repository;
  late TodoStore store;

  setUp(() {
    repository = TodoRepositoryMock();
    store = TodoStore(repository);
  });
  test('Store Should return Loaded State', () async {
    when(() => repository.fetchTodos()).thenAnswer((_) async => listTodo);

    expect(store.state, isA<LoadedTodoState>());
  });
}

List<TodoModel> listTodo = [
  TodoModel(title: 'dsadsadsa', isCompleted: true),
];
