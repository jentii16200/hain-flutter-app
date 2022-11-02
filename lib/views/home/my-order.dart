import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Orders"),
          backgroundColor: Colors.teal,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.shopping_basket),
                text: "Order",
              ),
              Tab(
                icon: Icon(Icons.checklist_rtl_rounded),
                text: "Status",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
