import 'package:curooosellll/detailviewmodel.dart';
import 'package:curooosellll/webservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CommonViewModel extends ChangeNotifier {
  List<DetailViewModel> details = <DetailViewModel>[];

  double cartAmount = 0;

  //List<Orders> orders = <Orders>[];

  late Map<String, dynamic> productDetails;

  Future<Map<String, dynamic>> getproductdetail(String id) async {
    productDetails = await Webservice().getproductdetail(id);
    return productDetails;
  }
}
