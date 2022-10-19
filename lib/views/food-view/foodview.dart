import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hain/global/add-cart-global.dart';
import 'package:hain/model/order-model.dart';
import 'package:hain/utils/mixns/convert.dart';
import 'package:hain/views/cart/cart.dart';
import 'package:quantity_input/quantity_input.dart';

class FoodView extends StatefulWidget {
  const FoodView({super.key, this.dish, this.ingredients, this.description, this.price, this.imgUrl});
  final String? dish;
  final List? ingredients;
  final String? description;
  final int? price;
  final String? imgUrl;
  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> with Convert, AfterLayoutMixin<FoodView> {
  final _remarksTextController = TextEditingController();
  int simpleIntInput = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _remarksTextController.dispose();
    super.dispose();
  }

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
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.1,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(widget.imgUrl!),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.dish!,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      '₱${widget.price.toString()}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(widget.description!),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      // cart.value.add({"dish": widget.dish!});
                      return showOrderPopUp(widget.dish!, widget.price!, widget.imgUrl!);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        isAllergy(userDetails.value['foodAllergy'] as List, widget.ingredients!)
                            ? GestureDetector(
                                onTap: () async {
                                  return await showWarning();
                                },
                                child: const Icon(
                                  Icons.warning,
                                  color: Colors.pink,
                                  size: 30.0,
                                ),
                              )
                            : Container(),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'ADD ORDER',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 6,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showWarning() async {
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
      },
    );
  }

  showOrderPopUp(String dish, int price, String imgUrl) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ), //this right here
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              height: 400,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 125,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ],
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(widget.imgUrl!),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            dish,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          QuantityInput(
                            inputWidth: 30,
                            buttonColor: Colors.teal,
                            acceptsNegatives: false,
                            value: simpleIntInput,
                            onChanged: (value) => setState(
                              () => simpleIntInput = int.parse(
                                value.replaceAll(',', ''),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Total Price: ${simpleIntInput * price}',
                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "Remarks",
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _remarksTextController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.teal), //<-- SEE HERE
                        ),
                        filled: true,
                        fillColor: Colors.white30, // <- this is required.
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (simpleIntInput == 0) {
                          Fluttertoast.showToast(
                            msg: "Please add quantity before you order!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.teal,
                            textColor: Colors.white,
                            fontSize: 15,
                          );
                        }
                        if (simpleIntInput > 0) {
                          OrderModel order = OrderModel(
                            widget.dish!,
                            simpleIntInput,
                            price,
                            _remarksTextController.value.text,
                            widget.imgUrl!,
                          );
                          cart.value.add(order);
                          print(cart.value);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        "ADD ORDER",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (isAllergy(userDetails.value['foodAllergy'] as List, widget.ingredients!)) {
      showWarning();
    }
  }
}
