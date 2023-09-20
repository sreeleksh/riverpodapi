import 'Products.dart';

class Carts {
  Carts({
      required this.id,
      required this.products,
      required this.total,
      required this.discountedTotal,
      required this.userId,
      required this.totalProducts,
      required this.totalQuantity,});

  Carts.fromJson(dynamic json) {
    id = json['id'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
    total = json['total'];
    discountedTotal = json['discountedTotal'];
    userId = json['userId'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
  }
 late int id;
 late List<Products> products;
 late int total;
 late  int discountedTotal;
 late int userId;
 late int totalProducts;
 late int totalQuantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (products != null) {
      map['products'] = products.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['discountedTotal'] = discountedTotal;
    map['userId'] = userId;
    map['totalProducts'] = totalProducts;
    map['totalQuantity'] = totalQuantity;
    return map;
  }

}