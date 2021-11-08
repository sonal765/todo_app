import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:todo_app/utils.dart';
import '../provider/todos.dart';
import '../model/todo.dart';
import '../page/edit_page.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
            actionPane: const SlidableDrawerActionPane(),
            //controls the layout and the animation of the slide menu
            key: Key(todo.id),
            actions: [
              IconSlideAction(
                // A basic slide action with an icon,a caption and a background color
                color: Colors.greenAccent,
                onTap: () => editTodo(context, todo),
                caption: 'Edit',
                icon: Icons.edit,
              ),
            ],
            secondaryActions: [
              IconSlideAction(
                  color: Colors.redAccent,
                  onTap: () => deleteTodo(context, todo),
                  caption: 'Delete',
                  icon: Icons.delete),
            ],
            child: buildTodo(context)),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
    onTap: ()=>editTodo(context, todo),
    child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                //We can use its onChanged property to interact or modify other widgets in the flutter app.
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);
  
                  Utils.showSnackBar(
                    context,
                    isDone ? 'Task completed' : 'Task mark incomplete',
                  );
                },
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  if (todo.desc.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        todo.desc,
                        style: const TextStyle(
                          fontSize: 20,
                          height: 1.5,
                        ),
                      ),
                    ),
                ],
              ),),
            ],
          ),
        ),
  );

  deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  editTodo(BuildContext context, Todo todo) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => EditTodoPage(todo:todo),));
}
