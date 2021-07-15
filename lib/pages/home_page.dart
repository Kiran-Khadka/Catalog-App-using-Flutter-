import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:second_app/models/catalog.dart';
import 'package:second_app/widgets/drawer.dart';
import 'package:second_app/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart'; // from mtechviral for building minimal UI
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
      backgroundColor: MyTheme.kCreamColor,
      body: SafeArea(
        child: Container(
            // Container later wrapped with Safe Area
            padding: Vx.m32,
            child: Column(
              children: [
                CatalogHeader(), // invokd CatalogHeader() class widget
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand() // expanding the CatalogList
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            )),
      ),
      drawer: MyDrawer(),
    );
  }
}

// header Catalog Header
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(MyTheme.darkBluishColor)
            .make(), //xl5 is textscalefactor
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

// class CatalogList widget
class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

// Class catalogItem
class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog
                .image, // final Item catalog is passed here as catalog.image
          ),
          ////Image.network(catalog.image).box.color(MyTheme.kCreamColor).make()
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                catalog.desc.text.make(),
                HeightBox(10), // 10.heightBox in velocity_x Style
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl2.make(),
                    ElevatedButton(onPressed: () {}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor,), // whether the button is clicked or not property is to be remain
                      shape: MaterialStateProperty.all(StadiumBorder())
                    ) ,

                    child: "Buy".text.make()),
                  ],
                ).pOnly(right: 8.0)// padding for button bar using Vx package
              ],
            ),
          )
        ],
      ),
    )
        .white
        .rounded
        .p8
        .square(150)
        .make()
        .py16()
        .w40(context); // VxBox is similar to container
  }
}

// passing the Image string here
class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image, // passing image from final String image declared
    ).box.rounded.p8.color(MyTheme.kCreamColor).make().p16().w40(context);
  }
}
