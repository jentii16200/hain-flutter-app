import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
        title: const Center(
          widthFactor: 2.5,
          child: Text('MY ACCOUNT'),
        ),
      ),
      body: Center(
        child: Text(
          "HELLO",
        ),
      ),
    );
  }
}
