class OrderModel {
  int? quantity;
  String? name;
  int? price;
  String remarks;
  String imgUrl;
  OrderModel(this.name, this.quantity, this.price, this.remarks, this.imgUrl);

  Map<String, dynamic> toJson() {
    return {
      'quantity': name,
      'name': quantity,
      'price': price,
      'remarks': remarks,
      'imgUrl': imgUrl,
    };
  }
}
