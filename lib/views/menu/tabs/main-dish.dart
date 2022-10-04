import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hain/controllers/menu/main-dish-controller.dart';
import 'package:hain/views/menu/tabs/menu-card.dart';

class MainDish extends StatefulWidget {
  const MainDish({super.key});

  @override
  State<MainDish> createState() => _MainDishState();
}

class _MainDishState extends State<MainDish> {
  final mainDishController = Get.put(MainDishController());
  @override
  void initState() {
    mainDishController.getMenu();
    print(mainDishController.menuList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => mainDishController.menuList.isNotEmpty
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: mainDishController.menuList.length,
                      itemBuilder: (context, i) {
                        return MenuCard(
                          name: mainDishController.menuList[i].name ?? "",
                          price: mainDishController.menuList[i].price ?? 0,
                          imageUrl:
                              mainDishController.menuList[i].imageUrl ?? "",
                          ingredients:
                              mainDishController.menuList[i].ingredients,
                        );
                      },
                    ),
                  )
                ],
              )
            : Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.3,
                    ),
                    const CircularProgressIndicator(
                      color: Colors.teal,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
