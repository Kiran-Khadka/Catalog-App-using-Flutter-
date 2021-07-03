
import 'package:flutter/material.dart';
import 'package:second_app/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // for learning
  // const pi = 3.14; // constant value cannot be modified or changed
  // final      // final can be modified 
  // widget is a kind of component
  

  @override
  Widget build(BuildContext context){ 
    return MaterialApp(
      home: HomePage(),
    );
  }
}
