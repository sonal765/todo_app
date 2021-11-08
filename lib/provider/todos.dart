import 'package:flutter/cupertino.dart';
import '../model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    // todo-list sample
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan the birthday Party',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Buy groceries',
      desc: '''-eggs
-milks
-breads''',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan the family Trip',
      desc: '''-Rent some hotel
-Rent a car
-Pack suitcase''',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk the dog',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  //get method

  List<Todo> get todoCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();
  //todo completed method

  void addTodo(Todo todo) {
    //add new todo list
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    //delete a particular todo list
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;

    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String desc) {
    //update a particular todo list
    todo.title = title;
    todo.desc = desc;

    notifyListeners();
  }
}
