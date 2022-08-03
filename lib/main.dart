import 'package:flutter/material.dart';
import 'package:loginpage/Screens/loginpage.dart';
import 'package:loginpage/Utilities/routes.dart';
import 'Screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.Login,
      routes: {
       MyRoutes.Home: (context) => HomePage(),
       MyRoutes.Login: (context) => LoginPage()
    },
    );
  }
}
