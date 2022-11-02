import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hain/views/cart/order/order-cart.dart';
import 'package:hain/views/cart/status/status.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade600,
          bottom: const TabBar(
            tabs: [
              Text(
                'ORDER',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                'STATUS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          title: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
              ),
              const Text("MY ORDERS"),
            ],
          ),
        ),
        body: const TabBarView(
          dragStartBehavior: DragStartBehavior.start,
          children: [
            OrderCart(),
            Status(),
          ],
        ),
      ),
    );
  }
}
