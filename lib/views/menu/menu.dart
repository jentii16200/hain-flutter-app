import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hain/views/menu/tabs/main-dish.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal.shade600,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.restaurant)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                ),
                const Text("MENU"),
              ],
            )),
        body: const TabBarView(
          dragStartBehavior: DragStartBehavior.start,
          children: [
            MainDish(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
