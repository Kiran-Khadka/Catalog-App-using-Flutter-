import 'package:flutter/material.dart';
import 'package:second_app/models/catalog.dart';
import 'package:second_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.kCreamColor,
      bottomNavigationBar: Container(
          color: Colors.white,
              child: ButtonBar( // wrapped with Container
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.darkBluishColor,
                        ), // whether the button is clicked or not property is to be remain
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.xl.make())
                .wh(100, 50), // wh means weight and height of button buy
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false, // safearea false for bottom
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image), // wrapped with Hero widget
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                // container wrapped with VxArc
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.make(),
                    10.heightBox,
                  ],
                ).py64(),
              ),
            ))
          ],
        ).p16(),
      ),
    );
  }
}
