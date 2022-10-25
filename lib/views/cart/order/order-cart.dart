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
              onPressed: () async {
                return await showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    contentPadding: const EdgeInsets.only(left: 25, right: 25),
                    title: Container(),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    content: SizedBox(
                      height: 300,
                      width: 300,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              children: const [
                                Text("ORDER ID"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("1"),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: Colors.black87,
                            ),
                            Row(
                              children: const [
                                Text("ORDER ID"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("1"),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          alignment: Alignment.bottomCenter,
                          decoration: const BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          child: TextButton(
                            child: const Text(
                              "CONFIRM",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
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
