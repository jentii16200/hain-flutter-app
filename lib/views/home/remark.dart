import 'package:flutter/material.dart';

class Remarks extends StatelessWidget {
  const Remarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remarks'),
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
        child: Center(
          child: Column(
            children: [
              Card(
                elevation: 50,
                shadowColor: Colors.black,
                color: Colors.tealAccent,
                child: SizedBox(
                  width: 310,
                  height: 510,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 108,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/profile_icon.png'),
                            radius: 40,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Remarks',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.teal,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Remarks',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
