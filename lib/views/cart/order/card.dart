import 'package:flutter/material.dart';
import 'package:hain/components/hainText.dart';
import 'package:hain/global/add-cart-global.dart';

class OrderCartCard extends StatefulWidget {
  const OrderCartCard({super.key});

  @override
  State<OrderCartCard> createState() => _OrderCartCardState();
}

class _OrderCartCardState extends State<OrderCartCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 18,
        right: MediaQuery.of(context).size.width / 18,
        top: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
        ),
        child: Row(
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
                    image: NetworkImage(cart.value[0].imgUrl),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 7,
            ),
            Column(
              children: const [
                HainText(
                  title: "test",
                  fontSize: 25,
                ),
                SizedBox(
                  height: 5,
                ),
                HainText(
                  title: "test",
                  fontSize: 15,
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 13,
            ),
          ],
        ),
      ),
    );
  }
}
