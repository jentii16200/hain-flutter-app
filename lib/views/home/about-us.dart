// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
        title: const Center(
          widthFactor: 3.4,
          child: Text('ABOUT US'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/bambooSchd.jpg',
              scale: 2.1,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "Location",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Image.asset(
              'assets/location.png',
              width: MediaQuery.of(context).size.width / 1.12,
              height: MediaQuery.of(context).size.height / 8.5,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Text(
              "OPEN HOURS ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade600,
              ),
            ),
          ),
          Center(
            child: Text(
              "MONDAY - SUNDAY 5PM - 3AM",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade600,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        await launchUrl(
                          Uri.parse('tel:09338611405'),
                        );
                      },
                      child: const Text(
                        '09338611405',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.facebook,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        await launchUrl(
                          Uri.parse(
                              'https://www.facebook.com/ilovebamboomalabon'),
                        );
                      },
                      child: const Text(
                        'Follow us on facebook!',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        await launchUrl(
                          Uri.parse(
                              'mailto:bamboobbq@yahoo.com?subject=This is Subject Title&body=This is Body of Email'),
                        );
                      },
                      child: const Text(
                        'bamboobbq@yahoo.com',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
