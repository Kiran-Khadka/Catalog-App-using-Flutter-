import 'package:flutter/material.dart';
import 'package:second_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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