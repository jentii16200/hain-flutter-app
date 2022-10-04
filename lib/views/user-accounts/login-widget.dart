// ignore_for_file: file_names, non_constant_identifier_names, avoid_single_cascade_in_expression_statements

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hain/global/add-cart-global.dart';
import 'package:hain/repositories/account-repositories.dart';
import 'package:hain/utils/mixns/login-mixin.dart';
import 'package:hain/views/home/dashboard.dart';
import 'package:hain/views/user-accounts/register-widget.dart';

class Login extends StatefulWidget with LoginMixin, AccountRepositories {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email/Username',
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
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              // TODO MAKE THIS RESPONSIVE
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 125.0),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.teal.shade600),
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
                FirebaseFirestore.instance
                    .collection("UserDetails")
                    .where("userName",
                        isEqualTo: _userNameController.value.text)
                    .where("password",
                        isEqualTo: _passwordController.value.text)
                    .get()
                    .then((QuerySnapshot querySnapshot) {
                  if (querySnapshot.size == 0) {
                    Fluttertoast.showToast(
                      msg: "Invalid Username/Password",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 15,
                    );
                  }
                  if (querySnapshot.size == 1) {
                    userDetails.value = querySnapshot.docs[0].data() as Map;
                    Fluttertoast.showToast(
                      msg: "Welcome ${querySnapshot.docs[0]["name"]}!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 15,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashBoard(),
                      ),
                    );
                  }
                });
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
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
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
