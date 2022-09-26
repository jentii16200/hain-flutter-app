// ignore_for_file: file_namesc

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _userNameController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Register",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _userNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'User Account Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
          ),
          ElevatedButton(
            // TODO MAKE THIS RESPONSIVE
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 15, horizontal: 125.0),
              ),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.teal.shade600),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  side: BorderSide(
                    color: Colors.teal.shade600,
                  ),
                ),
              ),
            ),
            onPressed: () async {
              // if (_userNameController.value.text.isEmpty && _passwordController.value.text.isEmpty) {
              //   Fluttertoast.showToast(
              //     msg: "Please fill the missing fields!",
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.BOTTOM,
              //     timeInSecForIosWeb: 1,
              //     backgroundColor: Colors.black,
              //     textColor: Colors.white,
              //     fontSize: 15,
              //   );
              // }
              await FirebaseFirestore.instance.collection("UserDetails").add({
                "userName": _userNameController.value.text,
                "password": _passwordController.value.text,
                "name": _nameController.value.text,
              }).then((value) {
                Fluttertoast.showToast(
                  msg: "Successfully register a new account!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.teal,
                  textColor: Colors.white,
                  fontSize: 20,
                );
                Navigator.of(context).pop();
              }).catchError((onError) => log(onError));
            },
            child: Text(
              "Register".toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
