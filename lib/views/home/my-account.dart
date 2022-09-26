// ignore_for_file: file_names

import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text(
          "HELLO",
        ),
      ),
    );
  }
}
