import 'package:flutter/material.dart';
import 'package:hain/global/add-cart-global.dart';
import 'package:hain/views/cart/order/components/add-to-cart-dialog-button.dart';
import 'package:hain/views/cart/order/components/card.dart';

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
          const AddToCartDialogButton(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
