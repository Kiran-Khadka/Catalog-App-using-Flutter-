import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// passing the Image string here
class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image, // passing image from final String image declared
    )
        .box
        .rounded
        .p8
        .color(context.canvasColor) /*color(MyTheme.kCreamColor)*/ .make()
        .p16()
        .w40(context);
  }
}
