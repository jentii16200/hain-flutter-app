import 'package:flutter/material.dart';
import 'package:hain/global/add-cart-global.dart';
import 'package:hain/utils/mixns/login-mixin.dart';
import 'package:hain/views/cart/cart.dart';
import 'package:hain/views/home/about-us.dart';
import 'package:hain/views/home/my-account.dart';
import 'package:hain/views/home/remark.dart';
import 'package:hain/views/menu/menu.dart';

import '../user-accounts/login-widget.dart';

class DashBoard extends StatefulWidget with LoginMixin {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 6,
            ),
            const Text("DASHBOARD"),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 36.0,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              'assets/bambooSchd.jpg',
              scale: 2.1,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Best Sellers",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/ramen-sample.jpg',
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 4,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/takotyaki-sample.jpg',
                    width: MediaQuery.of(context).size.width / 2.28,
                    height: MediaQuery.of(context).size.height / 8.5,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/bangus-sample.jpg',
                    width: MediaQuery.of(context).size.width / 2.28,
                    height: MediaQuery.of(context).size.height / 8.5,
                    fit: BoxFit.fill,
                  ),
                ],
              )
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal.shade600,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(40), // Image radius
                      child:
                          Image.asset('assets/bamboo.jpg', fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    userDetails.value['name'] ?? "",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('My Account'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyAccount()),
                );
              },
            ),
            ListTile(
              title: const Text('Food Menu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Menu()),
                );
              },
            ),
            ListTile(
              title: const Text('Orders'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Remarks'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Remarks()),
                );
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUs()),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                cart.value.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
