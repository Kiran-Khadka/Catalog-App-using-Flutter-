import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:second_app/models/catalog.dart';
import 'package:second_app/utils/routes.dart';
import 'package:second_app/widgets/drawer.dart';
import 'package:second_app/widgets/homepage_widgets/catalog_header.dart';
import 'package:second_app/widgets/homepage_widgets/catalog_list.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';


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

  // loading the data
  loadData() async {
    // extracting the data from json file

    //await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
        "assets/files/catalog.json"); // to extract the json files which gives the string value and so for json mapping decoding is done in line below
    final decodedData = jsonDecode(catalogJson);
    var productsData =
        decodedData["products"]; // taking products oonly from the decoded data
    ////List<Item> list = List.from(productsData)
    CatalogModel.items =
        List.from(productsData) // taking list from productsData
            .map<Item>((item) => Item.fromMap(item))
            .toList();
    setState(() {});
    //// print (decodedData);
    ////print (productsData);
  }

  @override
  Widget build(BuildContext context) {
    //* context is a reference to the location of a widget within the tree str of all widgets which are built and is stateless element
    ////final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      /////backgroundColor: MyTheme.kCreamColor,
      backgroundColor: context.cardColor,
      ////backgroundColor: Theme.of(context).cardColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context,
            MyRoutes.cartRoute), // send to Cart Page when cart icon is clicked
        backgroundColor: context
            .theme.buttonColor, // using Vx color of button from themes.dart
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ), // floating action button
      body: SafeArea(
        child: Container(
            // Container later wrapped with Safe Area
            padding: Vx.m32,
            child: Column(
              children: [
                CatalogHeader(), // invokd CatalogHeader() class widget
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand() // expanding the CatalogList
                else
                  CircularProgressIndicator()
                      .centered()
                      .py16()
                      .expand(), //py16 means padding in y axis
              ],
            )),
      ),
      drawer: MyDrawer(),
    );
  }
}
