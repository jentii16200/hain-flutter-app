import 'package:flutter/material.dart';
import 'package:hain/components/hainText.dart';
import 'package:hain/views/food-view/foodview.dart';

class MenuCard extends StatelessWidget {
  final String? name;
  final int? price;
  final String? imageUrl;
  final List? ingredients;
  final String? description;
  const MenuCard({super.key, this.name, this.price, this.imageUrl, this.ingredients, this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodView(
              dish: name?.replaceAll("\\n", ""),
              ingredients: ingredients,
              description: description,
              price: price,
              imgUrl: imageUrl,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 18, right: MediaQuery.of(context).size.width / 18, top: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 7,
              ),
              Column(
                children: [
                  HainText(
                    title: name!,
                    fontSize: 25,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  HainText(
                    title: price.toString(),
                    fontSize: 15,
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 13,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.1,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(imageUrl!),
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
