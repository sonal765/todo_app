import 'package:flutter/material.dart';
import '../main.dart';
import '../widget/add_todo_dialog.dart';
import '../widget/todo_list.dart';
import '../widget/completed_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      const CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar( //displays a row of small widgets at the bottom 
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white, //on selected color changes to white
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
              size: 20,
            ),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton( 
        //represents the primary action of a screen
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add),
        onPressed: () => showDialog( 
          //notifies a pop up in the middle of the screen
          context: context,
          builder: (BuildContext context) => const AddTodoDialogWidget(),
          barrierDismissible: true,
           //which makes dialogs dismissible or not on external click
        ),
      ),
    );
  }
}
