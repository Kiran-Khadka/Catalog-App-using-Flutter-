
import 'package:flutter/material.dart';
import 'package:second_app/models/catalog.dart';


class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) 
  : //assert(item!=null),
  super(key: key);
  
 //* assert is used only in debugging process to check null safety 
  @override
  Widget build(BuildContext context) {
    return Card(
       shape: StadiumBorder(),
          child: ListTile(
             onTap: () {
               print("${item.name} press"); // $ is for multiple holding
             },
            leading:Image.network(item.image),
            title: Text(item.name),
            subtitle: Text(item.desc),
            //trailing: Text (item.price.toString()),
            trailing: Text("\$${item.price}",
            textScaleFactor: 1.4,
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),), // two $ is for adding the variable
            
         ),
    );
  }
}