// ignore: file_names
import 'package:hain/global/add-cart-global.dart';

abstract class CalculateTotal {
  calculateTotalPriceOrder() async {
    int result = 0;
    int total = 0;
    cart.value.forEach((v) {
      total = v.quantity * v.price;
      result = result + total;
    });

    return result;
  }
}
