import 'package:calori_tracker/components/bottom_navbar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;
  List<Widget> get pages => [
        Scaffold(
          body: Container(
            child: Center(
              child: Text(
                "1",
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ),
        ),
        Scaffold(
          body: Container(
            child: Center(
              child: Text(
                "2",
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ),
        ),
        Scaffold(
          body: Container(
            child: Center(
              child: Text(
                "3",
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavbar(
        onTap: (int value) {
          setState(() {
            pageIndex = value;
          });
        },
        pageIndex: pageIndex,
      ),
    );
  }
}
