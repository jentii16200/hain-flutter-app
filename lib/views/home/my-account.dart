// ignore_for_file: file_names

import 'package:flutter/material.dart';

class  MyAccount extends StatelessWidget {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              child: Image.asset(
                'assets/profile_icon.png',
                scale: 2.1,
              ),
            ),
          ),
        ],
      ),
