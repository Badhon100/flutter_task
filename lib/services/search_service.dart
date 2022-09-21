

import 'package:flutter_task/models/search_result_model.dart';
import 'package:http/http.dart' as http;

import '../const/url.dart';

class SearchService {
  SearchService({required this.searchKey});
  String searchKey;
  Future<SearchResultModel?> getSearchData() async {
    var uri = Uri.parse("https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=$searchKey");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;

      return searchResultModelFromJson(json);
    }
    return null;
  }
}
