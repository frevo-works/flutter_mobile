import 'dart:async';

import 'db_provider.dart';
import 'todo.dart';

class TodoBloc {
  final _todoController = StreamController<List<Todo>>();
  Stream<List<Todo>> get todoStream => _todoController.stream;

  getTodos() async {
    _todoController.sink.add(await DBProvider.db.getAllTodos());
  }

  TodoBloc() {
    getTodos();
  }

  dispose() {
    _todoController.close();
  }

  create(Todo todo) {
    todo.assignUUID();
    DBProvider.db.createTodo(todo);
    getTodos();
  }

  update(Todo todo) {
    DBProvider.db.updateTodo(todo);
    getTodos();
  }

  delete(String id) {
    DBProvider.db.deleteTodo(id);
    getTodos();
  }
}
