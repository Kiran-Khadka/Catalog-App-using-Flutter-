import 'package:flutter/material.dart';
import 'package:second_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

// CartPage widget with holder
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////backgroundColor: MyTheme.kCreamColor,
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          ////Placeholder()
          _CartList()
              .p32()
              .expand(), // placing placeholder with padding of the 32 dp from all the sides
          // expand gives the placeholder placeholder is placed according to the available screen size
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

// widget _cartTotal which is for the total of the cart
class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$9999".text.xl5.color(context.theme.accentColor).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(StadiumBorder())),
            child: "Buy".text.xl.make(),
          ).w32(context),
        ],
      ),
    );
  }
}

// _CartList widget with remove button functionality
class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        title: "Item 1".text.make(),
      ),
    );
  }
}
