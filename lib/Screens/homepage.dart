import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/Widget/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Homepage"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Add",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: "Profile",
            ),
          ],
          selectedItemColor: Colors.white,
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
