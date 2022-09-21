

import 'package:flutter_task/models/search_result_model.dart';
import 'package:http/http.dart' as http;

import '../const/url.dart';

class ProductDetailsService {
  ProductDetailsService(this.slug);
  String? slug;
  Future<SearchResultModel?> getProductDetails() async {
    var uri = Uri.parse("https://panel.supplyline.network/api/product-details/$slug/");
    var response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var json = response.body;

      return searchResultModelFromJson(json);
    }
    return null;
  }
}
