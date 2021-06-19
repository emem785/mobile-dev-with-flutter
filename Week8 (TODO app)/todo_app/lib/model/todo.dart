import 'package:flutter/material.dart';

class TODO{
  final String title;
final String desc;
final String date;

  TODO({
    @required this.title,
    @required this.desc,
    @required this.date,
  });



  factory TODO.fromMap(Map<String, dynamic> map) {
    return new TODO(
      title: map['title'] as String,
      desc: map['desc'] as String,
      date: map['date'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'desc': this.desc,
      'date': this.date,
    } as Map<String, dynamic>;
  }

}