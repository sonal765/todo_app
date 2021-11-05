import 'package:flutter/cupertino.dart';
import '../model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [ // todo-list sample  
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
}
