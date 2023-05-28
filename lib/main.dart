
//flutter import
import 'package:flutter/material.dart';

//my file import
import 'package:rock_paper/screen/rock_paper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RockPaper(),
    );
  }
}

