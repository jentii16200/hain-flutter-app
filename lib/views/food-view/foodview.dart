import 'package:flutter/material.dart';
import 'package:hain/global/add-cart-global.dart';
import 'package:hain/utils/mixns/convert.dart';
import 'package:hain/views/cart/cart.dart';

class FoodView extends StatefulWidget {
  const FoodView({super.key, this.dish, this.ingredients, this.description, this.price});
  final String? dish;
  final List? ingredients;
  final String? description;
  final int? price;
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
          Center(
            child: Text('FOOD VIEW ${widget.dish!}'),
          ),
          TextButton(
            onPressed: () {
              cart.value.add({"dish": widget.dish!});
            },
            child: Row(
              children: [
                isAllergy(userDetails.value['foodAllergy'] as List, widget.ingredients!)
                    ? GestureDetector(
                        onTap: () async {
                          return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ), //this right here
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      ),
                                    ),
                                    height: 200,
                                    child: const Padding(
                                      padding: EdgeInsets.all(40.0),
                                      child: Text(
                                        "Warning there is an ingredient that might trigger your allergy!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: const Icon(
                          Icons.warning,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                      )
                    : Container(),
                const Text('Add Order'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
