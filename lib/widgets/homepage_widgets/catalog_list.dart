import 'package:flutter/material.dart';
import 'package:second_app/models/catalog.dart';
import 'package:second_app/pages/home_details_page.dart';
import 'package:second_app/widgets/homepage_widgets/catalog_image.dart';
import 'package:second_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: CatalogItem(
                catalog: catalog)); // CatalogItem later wrapped with InkWell
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
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              // wrapped with Hero widget
              image: catalog
                  .image, // final Item catalog is passed here as catalog.image
            ),
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
                  buttonPadding: EdgeInsets.zero, // padding for button
                  children: [
                    "\$${catalog.price}".text.bold.xl2.make(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              MyTheme.darkBluishColor,
                            ), // whether the button is clicked or not property is to be remain
                            shape: MaterialStateProperty.all(StadiumBorder())),
                        child: "Buy".text.make()),
                  ],
                ).pOnly(right: 8.0)
                // padding for button bar using Vx package
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
        .w32(context); // 32% width of the mediaquery width
    // VxBox is similar to container
  }
}
