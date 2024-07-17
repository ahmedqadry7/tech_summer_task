import 'package:http/http.dart' as http;
import 'package:route_tech_task/constans.dart';
import 'package:route_tech_task/model/product_response.dart';
import 'dart:convert';

class ApiManager {
  static Future<ProductResponse> getProducts() async {
    Uri url = Uri.https(Constants.baseUrl, "/products");
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> json = jsonDecode(response.body);
        return ProductResponse.fromJson(json);
      } catch (e) {
        throw Exception("Error parsing JSON: $e");
      }
    } else {
      throw Exception("Failed to load products");
    }
  }
}
