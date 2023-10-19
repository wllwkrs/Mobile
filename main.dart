
import 'package:flutter/material.dart';
import 'package:helloworld/ui/PersonalForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PersonalForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}
