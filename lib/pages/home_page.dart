import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:second_app/models/catalog.dart';
import 'package:second_app/widgets/drawer.dart';
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

  // loading the data
  loadData() async {
    // extracting the d ata from json file

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
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      // Scaffold is top level container for material app
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16), // crossAxisCount is important
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias, // for clipping and shaping distinction on the edge
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GridTile(
                        header: Text(item.name),
                        child: Image.network(item.image),
                        footer: Text(item.price.toString()),
                        
                        )
                        );
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: LinearProgressIndicator(backgroundColor: Colors.black),
              ),
      ),
      drawer: MyDrawer(), // drawer is similar to footer
    );
  }
}
