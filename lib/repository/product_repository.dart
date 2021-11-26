import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:kasemall/model/product_detail_model.dart';
import 'package:kasemall/model/product_model.dart';
import 'package:kasemall/model/query_product_model.dart';

class ProductRepository with ChangeNotifier {
  List<ProductModel> products = [];
  List<QueryModel> queries = [];
  int pageProduct = 1;
  List<ProductModel> get getListProducts => products;

  int get getLengthProduct => products.length;

  Future<ProductDetailModel?> getProductDetail(
      {BuildContext? context, int? productId}) async {
    try {
      String _urlApi = 'https://kasefarm1.kasegro.com/api/public/home';
      final repsonse = await http.get(Uri.parse(_urlApi));
      if (repsonse.statusCode == 200) {
        return ProductDetailModel.fromJson(jsonDecode(repsonse.body)['data']);
      }
    } on SocketException catch (_) {
      throw 'No Internet Connection';
    }
  }

  Future<void> getProducts(
      {BuildContext? context, Locale? locale, int? page}) async {
    try {
      if (products.length >= 10) {
        ++pageProduct;
      }

      var queryParam = {
        "id": "093216",
        "token": "GanGosFutureToken2020",
        "page": pageProduct.toString()
      };
      List<ProductModel> _listProduct = [];
      String _urlApi = 'https://kasefarm1.kasegro.com/api/public/home';
      final response = await http.get(
        Uri.parse(_urlApi),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Content-language': locale.toString()
        },
      );

      if (response.statusCode == 200) {
        _listProduct = List<ProductModel>.from(jsonDecode(response.body)['data']
                ['new_products']
            .map((x) => ProductModel.fromJson(x)));
        if (page == null)
          products = _listProduct;
        else
          products.addAll(_listProduct);
        notifyListeners();
      }
    } on SocketException catch (e) {
      print(e);
      internetLostConnection(context: context);
    }
  }
}

Future<void> internetLostConnection({BuildContext? context}) async {
  return showDialog(
    context: context!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ListBody(
              children: <Widget>[
                Icon(
                  Icons.wifi_off_rounded,
                  color: Colors.redAccent,
                  size: 70,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  'Opps...',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                )),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text('No Internet Connection',
                        textAlign: TextAlign.center)),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
