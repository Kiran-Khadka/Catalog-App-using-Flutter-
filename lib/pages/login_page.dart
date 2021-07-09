import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:second_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    // this is method
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_img.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                // here first column with children is made and column is wrapped with padding
                children: [
                  TextFormField(
                    // Text Form Field has more advantage over normal text feild
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () async{
                      setState(() {
                        changeButton = true;
                      });

                      await Future.delayed(Duration(seconds: 1));
                       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    // to add animation this line is commented child: Container(
                     child: AnimatedContainer(
                     duration: Duration(seconds: 1),
                      width: changeButton? 50: 150, // if changeButton is true then width is 50 if false 150
                      height: 50,
                      // color: Colors.deepOrange, // this is commented as it is added in the box decoration.
                      alignment: Alignment.center,
                      child: changeButton?Icon(Icons.done, color:Colors.white): Text("Log in",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                       // shape: changeButton
                        //    ?BoxShape.circle
                         //   : BoxShape.rectangle,
                         borderRadius: BorderRadius.circular(changeButton? 50: 8)

                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   child: Text("Login"),
                  //   style: TextButton.styleFrom(
                  //       minimumSize: Size(150, 40)),
                  //   onPressed: () {
                  //      Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   }
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
