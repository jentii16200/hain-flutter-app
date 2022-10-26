import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hain/controllers/order-controller.dart';
import 'package:hain/global/add-cart-global.dart';
import 'package:hain/utils/mixns/calculate-total.dart';
import 'package:hain/views/cart/order/components/dialog-tables.dart';

class AddToCartDialogButton extends StatefulWidget {
  const AddToCartDialogButton({super.key});

  @override
  State<AddToCartDialogButton> createState() => _AddToCartDialogButtonState();
}

class _AddToCartDialogButtonState extends State<AddToCartDialogButton> with CalculateTotal {
  String totalPrice = "";
  final orderController = Get.put(OrderController());
  @override
  void initState() {
    getTotal();
  }

  Future getTotal() async {
    int result = await calculateTotalPriceOrder();
    setState(() {
      totalPrice = result.toString();
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          //  SHOW DIALOG FOR ORDERS
          return await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              contentPadding: const EdgeInsets.only(left: 25, right: 25),
              title: Container(),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: SizedBox(
                height: 300,
                width: 400,
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
                        children: [
                          const Text("FULL NAME: "),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(userDetails.value['name']),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.black87,
                      ),
                      const TableContent(),
                    ],
                  ),
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("TOTAL PRICE"),
                    Text(totalPrice),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                      onPressed: () {
                        if (cart.value.length == 0) {
                          Fluttertoast.showToast(
                            msg: "Please put an order!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.teal,
                            textColor: Colors.white,
                            fontSize: 15,
                          );
                          Navigator.pop(context);
                        }
                        if (cart.value.length != 0) {
                          orderController.confirmOrder().then((value) {
                            Fluttertoast.showToast(
                              msg: "Thank you for order!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.teal,
                              textColor: Colors.white,
                              fontSize: 15,
                            );
                            setState(() {
                              cart.value.clear();
                            });

                            Navigator.pop(context);
                          });
                        }
                      },
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              cart.value.length.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            const Text(
              "ADD ORDER",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              totalPrice,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
