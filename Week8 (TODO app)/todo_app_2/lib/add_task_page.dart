import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_2/TODO.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_2/main.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  Color appBarPrimaryColor = Color(0xFF1B87A9);
  Color backgroundColor = Color(0xFF1B87A9);

  TextEditingController _date = TextEditingController(text: "");
  TextEditingController _desc = TextEditingController(text: "");
  TextEditingController _title = TextEditingController(text: "");
  var selectedDate = DateTime.now();
  FocusNode dateNode = FocusNode();

  @override
  void dispose() {
    _date.dispose();
    _desc.dispose();
    _title.dispose();
    super.dispose();
  }

  Future<void> saveData(TODO todo) async {
    final prefs = await SharedPreferences.getInstance();
    final todoStrList = prefs.getStringList("todo");
    final newList = [...?todoStrList,jsonEncode(todo.toMap())];
    prefs.setStringList("todo",newList);

  }
  // Future<void> saveNewData(TODO todo,SharedPreferences prefs)async{
  //   final todoStrList = [jsonEncode(todo.toMap())];
  //   prefs.setStringList("todo",todoStrList );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: appBarPrimaryColor,
          ),
        ),
        title: Text(
          "Add Task",
          style: TextStyle(
            color: appBarPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveData(TODO(
            date: _date.text,
            title: _title.text,
            desc: _desc.text,
          ));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.check,
          color: Color(0xFF21BE57),
          size: 32.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  controller: _title,
                  decoration: InputDecoration(
                      hintText: "Title",
                      labelText: "What is to be done?",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  controller: _desc,
                  decoration: InputDecoration(
                      labelText: "Description of task",
                      labelStyle: Theme.of(context).textTheme.headline6,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  focusNode: dateNode,
                  controller: _date,
                  onTap: () async => _selectDate(context),
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.white,
                      ),
                      hintText: "dd/mm/yy",
                      labelText: "Due Date",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final dateFormat = DateFormat("dd/MM/yyyy");
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null || picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _date.text = dateFormat.format(selectedDate);
        dateNode.previousFocus();
      });
  }
}
