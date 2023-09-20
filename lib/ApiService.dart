import 'dart:convert';

import 'Carts.dart';
import 'package:http/http.dart' as http;

import 'cartsapi.dart';

class ApiService{

  Future<List<Carts>> fetchproducts() async {
    var response=await http.get(Uri.parse("https://dummyjson.com/carts"));
    final jsonData = json.decode(response.body.toString());
    var data=Cartsapi.fromJson(jsonData);
    var c=data.carts;
    return c;
  }
}