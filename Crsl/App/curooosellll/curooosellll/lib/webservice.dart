import 'dart:convert';

import 'package:curooosellll/detailsmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

class Webservice {
  // String baseurl = "http://169.254.83.99:8080/example/";
  String baseurl = "http://192.168.43.181:8080/example/";

  Future<Map<String, dynamic>> getproductdetail(String id) async {
    var result;

    final Map<String, dynamic> productdetail = {
      'id': id,
    };
    print(productdetail.toString());
    String url = baseurl + "viewproduct.jsp";
    final response = await http.post(Uri.parse(url), body: productdetail);

    if (response.statusCode == 200) {
      print("hai>>>>>>>>>>>>>");
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      var productData = responseData;
      print("productData :" + productData.toString());
      Detailmodel authUser = Detailmodel.fromJson(productData);
      result = {
        'status': true,
        'message': 'successful',
        'productData': authUser
      };
      // print(">>>>>>>>>>>>>>>>>>>>>hellloo");
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
      print("heooooo>>>>>>>>>>");
    }
    return result;
  }
}
