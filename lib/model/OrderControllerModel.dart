// ignore: file_names
import 'package:hain/global/add-cart-global.dart';

class OrderControllerModel {
  final String? orderId;
  final String? status;
  // USERDETAILS
  final String? name;
  final List? allergy;
  final String? userId;
  // ORDERS
  final List? dish;
  final int? quantity;
  final int? price;
  OrderControllerModel({
    this.orderId,
    this.status,
    this.name,
    this.allergy,
    this.userId,
    this.dish,
    this.quantity,
    this.price,
  });

  factory OrderControllerModel.fromJson(Map<String, dynamic> json) {
    return OrderControllerModel(
      orderId: json['orderId'],
      status: json['status'],
      name: json['userDetails']['name'],
      allergy: json['userDetails']['allergy'],
      userId: json['userDetails']['userId'],
      dish: json['orders']['dish'],
      quantity: json['orders']['quantity'],
      price: json['orders']['price'],
    );
  }
}

class OrderMapModel {
  static orderModel() {
    Map<dynamic, dynamic> order = {};
    order['orderId'] = "";
    order['status'] = "";
    order['userDetails'] = {
      'name': userDetails.value['name'],
      'allergy': userDetails.value['foodAllergy'],
      'id': userDetailsId.value,
    };
    order['order'] = [...cart.value];
    return order;
  }
}
