import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:prueba_kubo/src/models/product.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'detail_product/detail_product_view.dart';

class HomeController extends ControllerMVC {
  factory HomeController() {
    _this = HomeController._();
    return _this;
  }
  static HomeController _this;

  HomeController._();

  static HomeController get con => _this;

  String pageName = 'Home';
  bool isSearching = false;
  Future<Product> product;
  Product principal = Product(data: []);
  Product aux = Product(data: []);
  List<String> listString = [];

  Future<Product> fetchProduct() async {
    final response = await http.get(
      Uri.parse(
        'https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0/',
      ),
    );

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw 'Lo sentimos, intenta de nuevo más tarde';
    }
  }

  String formatCurrncy(int number) {
    return '${NumberFormat.simpleCurrency().format(number).replaceAll('.00', '').replaceAll(',', '.')} COP';
  }

  void prueba() async {
    principal = await product;
    print(principal.data[0].descripcion);
  }

  void filterByName(String text) async {
    setState(() {
      aux.data = principal.data
          .where(
            (product) => product.nombre
                .toLowerCase()
                .replaceAll(' ', '')
                .replaceAll('á', 'a')
                .replaceAll('é', 'e')
                .replaceAll('í', 'i')
                .replaceAll('ó', 'o')
                .replaceAll('ú', 'u')
                .contains(
                  text
                      .toLowerCase()
                      .replaceAll(' ', '')
                      .replaceAll('á', 'a')
                      .replaceAll('é', 'e')
                      .replaceAll('í', 'i')
                      .replaceAll('ó', 'o')
                      .replaceAll('ú', 'u'),
                ),
          )
          .toList();
    });
  }

  void toDetail(context, Data data) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => DetailproductView(
          product: data,
        ),
      ),
    );
  }

  getHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    listString = (prefs.getStringList("list"));
    await prefs.setStringList("list", listString);
  }

  setHistory(String text) async {
    listString.add(text);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("list", listString);
  }
}
