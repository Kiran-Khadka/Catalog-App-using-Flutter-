import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:second_app/models/catalog.dart';
import 'package:second_app/widgets/drawer.dart';
import 'package:second_app/widgets/item_widget.dart';
import 'dart:convert';
//* ctrl + dot to import the package
//* In stateless widget the variable can be declared and all the work can
// can be done inside the build method
//* In Stateless Widget never changes and no mutation occurs,

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final days = 30;
  final name = "Kiran Khadka";
  
  //* lifecycle of the Stateful Widget is important
  @override
  void initState() {
    super.initState();
    loadData();
    
  
  }

  loadData() async { // extracting the data from json file
var catalogJson = await rootBundle.loadString("assets/files/catalog.json"); // to extract the json files which gives the string value and so for json mapping decoding is done in line below
  var decodedData = jsonDecode(catalogJson);
  var productsData = decodedData["products"]; // taking products oonly from the decoded data 
   //// print (decodedData);
    print (productsData);
  }



  @override
  Widget build(BuildContext context) {
    //* context is a reference to the location of a widget within the tree str of all widgets which are built and is stateless element
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      // Scaffold is top level container for material app
      body: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              ////item: CatalogModel.items[index],
              item: dummyList[index],
            ); // this returns the ItemWidget class from item_widget.dart
          }),
      drawer: MyDrawer(), // drawer is similar to footer
    );
  }
}
