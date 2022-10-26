import 'dart:convert';

import 'package:get/get.dart';
import 'package:hain/model/OrderControllerModel.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  // RxList<MainDishModel> menuList = (List<MainDishModel>.of([])).obs;

  Future confirmOrder() async {
    Map<dynamic, dynamic> order = OrderMapModel.orderModel();

    var url = Uri.parse('https://us-central1-hain-402aa.cloudfunctions.net/api/addOrder');
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await http.post(url, headers: headers, body: jsonEncode({'data': order}));
    dynamic parsedJson = json.decode(response.body);
    print(parsedJson['result']);
    return parsedJson['result'];
  }
}
