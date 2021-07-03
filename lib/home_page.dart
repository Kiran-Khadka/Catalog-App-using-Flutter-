import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final days = 30;
  final name = "Kiran Khadka";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      // Scaffold is top level container for material app
      body: Center(
        child: Container(
          child: Text("Welcome $name to the $days days of the flutter coding"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
