// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hain/components/info-card.dart';

import '../../global/add-cart-global.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  static const name = "User's Name";
  static const allergy = "Allergy Type";

  @override
  Widget build(BuildContext context) {
    var circleAvatar = const CircleAvatar(
      backgroundImage: AssetImage('assets/profile_icon.png'),
      radius: 50,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
        title: const Center(
          widthFactor: 2.5,
          child: Text('MY ACCOUNT'),
        ),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          circleAvatar,
          Text(
            userDetails.value['name'],
            style: const TextStyle(
              fontSize: 40.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
            width: 200,
            child: Divider(color: Colors.teal),
          ),
          InfoCard(text: userDetails.value['name'], icon: Icons.person, onPressed: () async {}),
          InfoCard(text: userDetails.value['foodAllergy'].toString().replaceAll(RegExp(r'[^\w\s]+'), ''), icon: Icons.person, onPressed: () async {}),
        ]),
      ),
    );
  }
}
