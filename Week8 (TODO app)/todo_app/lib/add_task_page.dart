import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_2/model/todo.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  Color appBarPrimaryColor = Color(0xFF1B87A9);
  Color backgroundColor = Color(0xFF1B87A9);

  TextEditingController _title = TextEditingController(text: "");
  TextEditingController _desc = TextEditingController(text: "");
  TextEditingController _date = TextEditingController(text: "");

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  final initialDate = DateTime.now();
  final firstDate = DateTime(2000);
  final lastDate = DateTime(2025);

  final focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onStart();
  }

  _onStart() async {
    final prefs = await SharedPreferences.getInstance();
    final todoMap = prefs.getString("todo");
    print(todoMap);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _title.dispose();
    _desc.dispose();
    _date.dispose();
  }

  Future<void> _pickDate() async {
    final dateFormat = DateFormat("dd/MM/yyyy");

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null || pickedDate != initialDate) {
      setState(() {
        _date.text = dateFormat.format(pickedDate);
        focusNode.previousFocus();
      });
    }
  }

  Future<void> _saveData() async {
    if (_key.currentState.validate()) {
      final todo = TODO(title: _title.text, desc: _desc.text, date: _date.text);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("todo", jsonEncode(todo.toMap()));
    }
  }

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
        onPressed: () => _saveData(),
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
          key: _key,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  controller: _title,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "this field cannot be empty";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return "this field cannot be empty";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: "Description of task",
                      hintText: "Description",
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
                  controller: _date,
                  onTap: () => _pickDate(),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "this field cannot be empty";
                    }
                    return null;
                  },
                  focusNode: focusNode,
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
}
