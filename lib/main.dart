import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';
import './page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = "Todo App";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
     ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,//This line makes the trick to hide the “Slow Mode” 
        // or “Debug” banner by default visible at the upper-right corner in the emulator.
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Colors.blueGrey[50],//this will set your entire screen. 
          //It has a property named backgroundColor to change the background color of the Scaffold widget.
        ),
        home: const HomePage(),
      ),
    );
  }

