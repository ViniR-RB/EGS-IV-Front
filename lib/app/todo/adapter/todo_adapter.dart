import 'package:front/app/todo/model/todo_model.dart';

abstract class TodoAdapter {
  static TodoModel toModel(dynamic data) {
    return TodoModel(title: data['title'], isCompleted: data['isCompleted']);
  }
}
