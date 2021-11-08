import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todos.dart';
import '../model/todo.dart';
import '../widget/todo_form.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formkey = GlobalKey<FormState>();
  String title = "";
  String desc = "";

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    desc = widget.todo.desc;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Edit tools'),
          actions: [
            IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  provider.removeTodo(widget.todo);

                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: TodoFormWidget(
              title: title,
              desc: desc,
              onChangedDescription: (desc) => setState(() => this.desc = desc),
              onChangedTitle: (title) => setState(() => this.title = title),
              onSavedTodo: savedTodo,
            ),
          ),
        ),
      );

  void savedTodo() {
    final isValid = _formkey.currentState?.validate();
    if (isValid == false) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, desc);

      Navigator.of(context).pop();
    }
  }
}
