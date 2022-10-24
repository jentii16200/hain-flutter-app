import 'package:flutter/material.dart';
import 'package:hain/global/add-cart-global.dart';
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
              itemCount: cart.value.length,
              itemBuilder: (context, i) {
                return OrderCard(
                  index: i,
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "ADD ORDER",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
