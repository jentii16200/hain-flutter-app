import 'dart:convert';

import 'package:get/get.dart';
import 'package:hain/model/OrderControllerModel.dart';
import 'package:http/http.dart' as http;

class StatusController extends GetxController {
  RxList<OrderControllerModel> orderStatusList =
      (List<OrderControllerModel>.of([])).obs;
  RxList<dynamic> orderStatusListJSON = (List<dynamic>.of([])).obs;

  Future getOrderLogs() async {
    orderStatusList.clear();
    var url = Uri.parse(
        'https://us-central1-hain-402aa.cloudfunctions.net/api/getOrderLogs');
    var response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    var parsedJson = json.decode(response.body);
    return parsedJson;

    // TODO LATER MODEL
    // List<OrderControllerModel> parsedJsonData = (parsedJson as List<dynamic>)
    //     .map((job) => OrderControllerModel.fromJson(job))
    //     .toList();

    // orderStatusList.addAll(parsedJsonData);
    // print(orderStatusList);
  }
}
