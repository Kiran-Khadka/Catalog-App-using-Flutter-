import 'package:flutter/material.dart';
import 'package:second_app/pages/home_page.dart';
import 'package:second_app/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_app/utils/routes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // for learning
  // const pi = 3.14; // constant value cannot be modified or changed
  // final      // final can be modified
  // widget is a kind of component
  // function is outside of class whereas method is the fu~nction inside class

  @override // completion of the task
  Widget build(BuildContext context) {
    ///bringVegetables( thaila: false); //
    /// if the param is declared when calling the function then the function will take only that param which is declared when calling the function.
    /// like bringVegetables(rupees: 50);
    return MaterialApp(
      // home: HomePage(), is commented because the routes with homeentry is being made// class is called not the function
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      darkTheme: ThemeData( 
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
          fontFamily: GoogleFonts.lato().fontFamily,
          primaryTextTheme: GoogleFonts.latoTextTheme()),
      initialRoute:
              MyRoutes.homeRoute,
          //"/login", // home is opened instead of loginpage due to use of initialRoute
      routes: {
        "/": (context) => LoginPage(), // slash / itself is a home entry
        // this is object new LoginPage() also works
        // "/home": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }

  ////bringVegetables({@required bool thaila, int rupees = 100,}){ // parameters {} curly braces is for the optional param and the default value can be given
  // Take cycle

  // Go to shop 16
  ////}
}
