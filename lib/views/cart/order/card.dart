import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hain/components/hainText.dart';
import 'package:hain/global/add-cart-global.dart';

class OrderCard extends StatefulWidget {
  int? index;
  OrderCard({super.key, this.index});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return cart.value.isEmpty
        ? Container()
        : Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: CloseButton(
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          cart.value.removeAt(widget.index);
                        });

                        Fluttertoast.showToast(
                          msg: "Successfully remove an item!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.teal,
                          textColor: Colors.white,
                          fontSize: 15,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
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
                              image: NetworkImage(cart.value[widget.index].imgUrl),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                      ),
                      Column(
                        children: [
                          HainText(
                            title: cart.value[widget.index].name,
                            fontSize: 25,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          HainText(
                            title: cart.value[widget.index].price.toString(),
                            fontSize: 15,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          HainText(
                            title: cart.value[widget.index].quantity.toString(),
                            fontSize: 15,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 13,
                      ),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("widget"),
                  ),
                ],
              ),
            ),
          );
  }
}
