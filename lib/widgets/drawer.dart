import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageURL = "https://avatars.githubusercontent.com/u/63924970?s=60&v=4";
    return Drawer(
      child: ListView(  // ListView gives access to the list and array both
      children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
          
          child: UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: Text("Kiran Khadka"),
            accountEmail: Text("khadka@gmail.com"),
            currentAccountPicture: Image.network(imageURL), 
            //// currentAccountPicture: CircleAvatar (
              ////backgroundImage: NetworkImage (imageURL)
            //// ),
           ),
        ),
      ],

      ),
    );
  }
}