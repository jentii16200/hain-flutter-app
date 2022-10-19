import 'package:flutter/material.dart';
import 'package:hain/views/cart/order/card.dart';

class OrderCart extends StatefulWidget {
  const OrderCart({super.key});

  @override
  State<OrderCart> createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, i) {
                return const OrderCartCard();
              },
            ),
          )
        ],
      ),
    );
  }
}
