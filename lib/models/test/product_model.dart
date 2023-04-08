// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String? name;
  int? price;
  int? quantity;

  Product(
    this.name,
    this.price,
    this.quantity,
  );

  Product copyWith({
    String? name,
    int? price,
    int? quantity,
  }) {
    return Product(
      name ?? this.name,
      price ?? this.price,
      quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['name'] != null ? map['name'] as String : null,
      map['price'] != null ? map['price'] as int : null,
      map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Product(name: $name, price: $price, quantity: $quantity)';

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ quantity.hashCode;
}

class ProductModel {
  static List<Product> products = [];
}
