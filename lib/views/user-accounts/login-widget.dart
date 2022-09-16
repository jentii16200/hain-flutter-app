// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hain/utils/mixns/login-mixin.dart';

class Login extends StatelessWidget with LoginMixin {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            Center(
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(100), // Image radius
                  child: Image.asset('assets/bamboo.jpg', fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Sign In",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(context, 'Email/Username'),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(context, 'Password'),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
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
              onPressed: () {
                Navigator.of(context).pop(false);
                Navigator.of(context).push(createRoute());
              },
              child: Text(
                "Login".toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                const Text(
                  "New to this app?",
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    log("WALANG FOREVER");
                  },
                  child: const Text('Register'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
