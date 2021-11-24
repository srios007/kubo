import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:prueba_kubo/src/models/product.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeController extends ControllerMVC {
  factory HomeController() {
    _this = HomeController._();
    return _this;
  }
  static HomeController _this;

  HomeController._();

  static HomeController get con => _this;

  String pageName = 'Home';

  Future<Product> productsList;
  List<Data> aux1;
  List<Data> aux2;

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

  void filterByName(String text) async{
    setState(() {
      
      aux1 = aux2
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
}
