import 'dart:convert';

import 'package:get/get.dart';
import 'package:hain/model/main-dish-model.dart';
import 'package:http/http.dart' as http;

class MainDishController extends GetxController {
  RxList<MainDishModel> menuList = (List<MainDishModel>.of([])).obs;

  getMenu() async {
    menuList.clear();
    var url = Uri.parse('https://us-central1-hain-402aa.cloudfunctions.net/api/getMenu');
    var response = await http.post(url, body: {'type': 'dish'});
    dynamic parsedJson = json.decode(response.body);
    List<MainDishModel> parsedJsonData = (parsedJson as List<dynamic>).map((job) => MainDishModel.fromJson(job)).toList();

    menuList.addAll(parsedJsonData);
  }
}
