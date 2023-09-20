import 'Carts.dart';

class Cart {
  Cart({
      required this.carts,
      required this.total,
      required this.skip,
      required this.limit,});

  Cart.fromJson(dynamic json) {
    if (json['carts'] != null) {
      carts = [];
      json['carts'].forEach((v) {
        carts.add(Carts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  late List<Carts> carts;
   late int total;
 late int skip;
 late int limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (carts != null) {
      map['carts'] = carts.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}