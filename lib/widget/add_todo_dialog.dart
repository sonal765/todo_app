import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import './todo_form.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = " ";
  String desc = " ";
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Todo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(height: 8),
                TodoFormWidget(
                  onChangedTitle: (title) => setState(() => this.title = title),
                  onChangedDescription: (desc) =>
                      setState(() => this.desc = desc),
                  onSavedTodo: addTodo,
                ),
              ],
            ),
          ),
        ),
      );

  void addTodo() {
    final isValid = _formKey.currentState?.validate();

    if (isValid == false) {
      return  ;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        createdTime: DateTime.now(),
        title: title,
        desc: desc,
      );
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
