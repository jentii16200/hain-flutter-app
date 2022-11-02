import 'package:flutter/material.dart';
import 'package:hain/global/add-cart-global.dart';
import 'package:hain/views/cart/status/components/add-to-cart-dialog-button.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
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
          const StatusTable(),
        ],
      ),
    );
  }
}
