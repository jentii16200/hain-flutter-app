// ignore: file_names
import 'package:hain/global/add-cart-global.dart';

class OrderControllerModel {
  final String? orderId;
  final String? status;
  final List<Map<dynamic, dynamic>>? order;
  final List<Map<dynamic, dynamic>>? userDetails;
  // USERDETAILS
  // final String? name;
  // final List? allergy;
  // final String? userId;
  // // ORDERS
  // final String? dishName;
  // final int? quantity;
  // final int? price;
  OrderControllerModel({
    this.orderId,
    this.status,
    this.order,
    this.userDetails,
    // this.name,
    // this.allergy,
    // this.userId,
    // this.dishName,
    // this.quantity,
    // this.price,
  });

  factory OrderControllerModel.fromJson(Map<String, dynamic> json) {
    return OrderControllerModel(
        orderId: json['orderId'],
        status: json['status'],
        order: json['order'],
        userDetails: json['userDetails']
        // name: json['userDetails']['name'],
        // allergy: json['userDetails']['allergy'],
        // userId: json['userDetails']['userId'],
        // dishName: json['order']['name'],
        // quantity: json['order']['quantity'],
        // price: json['order']['price'],
        );
  }
}

class OrderMapModel {
  static orderModel() {
    Map<dynamic, dynamic> order = {};
    order['orderId'] = "";
    order['status'] = "pending";
    order['userDetails'] = {
      'name': userDetails.value['name'],
      'allergy': userDetails.value['foodAllergy'],
      'id': userDetailsId.value,
    };
    order['order'] = [...cart.value];
    return order;
  }
}
