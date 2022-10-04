import 'package:flutter/material.dart';
import 'package:hain/global/add-cart-global.dart';
import 'package:hain/utils/mixns/convert.dart';
import 'package:hain/views/cart/cart.dart';

class FoodView extends StatefulWidget {
  const FoodView({super.key, this.dish, this.ingredients});
  final String? dish;
  final List? ingredients;
  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> with Convert {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 36.0,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 25,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          isAllergy(
                  userDetails.value['foodAllergy'] as List, widget.ingredients!)
              ? const Text(
                  "Warning there is an ingredient that might trigger your allergy ")
              : Container(),
          Center(
            child: Text('FOOD VIEW ${widget.dish!}'),
          ),
          TextButton(
            onPressed: () {
              cart.value.add({"dish": widget.dish!});
            },
            child: const Text('Add Order'),
          )
        ],
      ),
    );
  }
}
