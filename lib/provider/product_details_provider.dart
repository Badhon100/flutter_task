import 'package:flutter/cupertino.dart';
import 'package:flutter_task/models/product_details_model.dart';
import 'package:flutter_task/services/product_details_service.dart';

class ProductDetailsProvider extends ChangeNotifier{
  ProductDetailsModel? productDetails;
  bool isLoaded = false;
  String? slug;
  Future<void> getData() async {
    try {
      productDetails = (await ProductDetailsService(slug).getProductDetails()) as ProductDetailsModel?;
      notifyListeners();
    // print(searchResult!.data!.products!.results![0].id);
    print(isLoaded);
    } catch (e) {
      print("search provider: $e");
    }
  }
}