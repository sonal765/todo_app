import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todos.dart';
import '../widget/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todoCompleted;
    return todos.isEmpty
        ? const Center(
            // when todo list is empty
            child: Text(
              'No Completed todos.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.separated(
            // list of todo will shown here
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
          );
  }
}
