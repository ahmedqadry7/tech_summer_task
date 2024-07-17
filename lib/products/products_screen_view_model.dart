import 'package:flutter/cupertino.dart';
import 'package:route_tech_task/api/api_manager.dart';
import 'package:route_tech_task/model/product_response.dart';

class ProductsScreenViewModel extends ChangeNotifier {
  // hold data - handle logic
  List<Products>? productsList;

  void getProducts() async {
    var response = await ApiManager.getProducts();
    productsList = response.products;
    notifyListeners();
  }
}
