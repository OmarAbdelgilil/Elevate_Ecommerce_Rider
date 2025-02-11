class OrderItem {
  String? product;
  int? price;
  int? quantity;
  String? id;

  OrderItem({this.product, this.price, this.quantity, this.id});

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        product: json['product'] as String?,
        price: json['price'] as int?,
        quantity: json['quantity'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product': product,
        'price': price,
        'quantity': quantity,
        '_id': id,
      };
}
