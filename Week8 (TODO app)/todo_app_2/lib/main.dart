import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_2/add_task_page.dart';

import 'TODO.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    theme: ThemeData(
        textTheme: TextTheme(
            headline6:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            subtitle1: TextStyle(color: Colors.white))),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Every color in flutter starts with the value 0xFF then place the hex code afterwards
  Color backgroundColor = Color(0xFF1B87A9);
  List<TODO> todos = [];

  @override
  initState() {
    startUp();
    super.initState();
  }

  Future<void> startUp() async {
    final cachedTodos = await _getCachedTodo();
    setState(() {
      todos = [if (cachedTodos.isNotEmpty) TODO.empty(), ...?cachedTodos];
    });
  }

  // Future<List<TODO>> getTodos() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final todoStr = prefs.getStringList("todo");
  //   if(todoStr == null){
  //   return  _getDefaultTodo(prefs);
  //   }
  //   return _getCachedTodos(prefs, todoStr);
  // }

  // List<TODO>_getCachedTodos(SharedPreferences prefs,List<String> todoStr) {
  //   final todos = List.from(todoStr).map((e) => TODO.fromMap(jsonDecode(e)));
  //   return todos.toList();
  // }
  //
  // List<TODO>_getDefaultTodo(SharedPreferences prefs) {
  //   Iterable<TODO> todos = [TODO(title: "", desc: "", date: "")];
  //   return todos ;
  // }

  Future<List<TODO>> _getCachedTodo() async {
    final prefs = await SharedPreferences.getInstance();
    final todoStr = prefs.getStringList("todo");
    return todoStr != null
        ? List.from(todoStr).map((e) => TODO.fromMap(jsonDecode(e))).toList()
        : [TODO.empty()];
  }

  _unCache(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final todoStr = prefs.getStringList("todo");
    todoStr.removeAt(index - 1);
    prefs.setStringList("todo", todoStr);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddTask()));
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Color(0xff1411C7),
            size: 32.0,
          ),
        ),
        appBar: AppBar(
          leading: SvgPicture.asset("assets/images/hourglass_empty.svg"),
          backgroundColor: Colors.white,
          //actions is for widgets at extreme right
          elevation: 16.0,
        ),
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: ListView.separated(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              var todo = todos[index];
              return index != 0
                  ? Dismissible(
                      onDismissed: (direction) {
                        setState(() {
                          todos.removeAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${todo.title} removed")));
                        });
                        _unCache(index);
                      },
                      key: Key(todo.title),
                      background: Container(color: backgroundColor),
                      child: Card(
                        elevation: 8,
                        child: ListTile(
                          title: Text(todo.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                          subtitle: Text(todo.desc),
                        ),
                        color: Colors.white,
                      ),
                    )
                  : SizedBox();
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(todos[index + 1].date,
                    style: TextStyle(color: Colors.white)),
              );
            },
          ),
        ),
      ),
    );
  }
}
