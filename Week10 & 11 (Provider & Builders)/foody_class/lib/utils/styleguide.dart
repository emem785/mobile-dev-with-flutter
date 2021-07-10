import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const labelStyle = TextStyle(color: Colors.black26, fontSize: 14);

final buttonElevation = MaterialStateProperty.all(0.0);
final buttonStyle = MaterialStateProperty.all(
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17));
final buttonShape = MaterialStateProperty.all(const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10))));
final buttonPadding =
    MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16));
final buttonSize = MaterialStateProperty.all(const Size(360, 60));
final buttonColor = MaterialStateProperty.all(const Color(0xFFFF6D00));
