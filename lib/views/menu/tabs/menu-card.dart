import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String? name;
  final int? price;
  final String? imageUrl;
  const MenuCard({super.key, this.name, this.price, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                name!,
              ),
              Text(
                price.toString(),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 7,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imageUrl!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
