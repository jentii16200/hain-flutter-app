import 'package:flutter/material.dart';
import 'package:hain/global/add-cart-global.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade600,
        ),
        body: Column(
          children: [
            const Center(
              child: Text("Cart"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.value.length,
                itemBuilder: (context, i) {
                  return Text(cart.value[i]['dish'] as String);
                },
              ),
            )
          ],
        ));
  }
}
