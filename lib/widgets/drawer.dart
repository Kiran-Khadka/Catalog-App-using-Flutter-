import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageURL =
        "https://avatars.githubusercontent.com/u/63924970?s=60&v=4";
    return Drawer(
      child: Container(
        color: Colors.deepOrange,
        child: ListView(
          // ListView gives access to the list and array both
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader( // this is drawer header
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.deepOrange),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,

                accountName: Text("Kiran Khadka"),
                accountEmail: Text("khadka@gmail.com"),
                ////currentAccountPicture: Image.network(imageURL),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(imageURL)

                        ///* Also AssetImage can be used here
                        ),
              ),
            ),
            Divider(
              height:0.0,
              thickness: 3.0,
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,
              color: Colors.white,),
              title: Text("Home",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,
              color: Colors.white,),
              title: Text("Profile",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail,
              color: Colors.white,),
              title: Text("Email me",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
