// Builtin & ThirdParty Imports
import 'package:flutter/material.dart';

// Custom Made Imports
import 'package:todolist_with_firebase/model/todo.dart';
import 'package:todolist_with_firebase/api/firebase_api.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos {
    return _todos.where((todo) => todo.isCompleted == false).toList();
  }

  List<Todo> get completedTodos {
    return _todos.where((todo) => todo.isCompleted == true).toList();
  }

  void setTodos(List<Todo> todos) {
    // this function runs after build method
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _todos = todos;
      notifyListeners();
    });
  }

  void addTodo(Todo todo) {
    FirebaseApi.createTodo(todo);
  }

  void removeTodo(Todo todo) {
    FirebaseApi.deleteTodo(todo);
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isCompleted = !todo.isCompleted;
    FirebaseApi.updateTodo(todo);
    return todo.isCompleted;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    FirebaseApi.updateTodo(todo);
  }
}
