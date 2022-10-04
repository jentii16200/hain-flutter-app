import 'package:flutter/material.dart';
import 'package:hain/views/food-view/foodview.dart';

class MenuCard extends StatelessWidget {
  final String? name;
  final int? price;
  final String? imageUrl;
  final List? ingredients;
  const MenuCard(
      {super.key, this.name, this.price, this.imageUrl, this.ingredients});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FoodView(
                    dish: name!,
                    ingredients: ingredients,
                  )),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 5,
            ),
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
      ),
    );
  }
}
