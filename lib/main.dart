
import 'package:finalexam/Page1.dart';
import 'package:finalexam/Page2.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Multiplication(),

      },
    ),
  );
}
