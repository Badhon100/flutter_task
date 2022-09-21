import 'package:flutter/cupertino.dart';
import 'package:flutter_task/models/search_result_model.dart';
import 'package:flutter_task/services/search_service.dart';

class SearchResultProvider extends ChangeNotifier{
  SearchResultModel? searchResult;
  bool isLoaded = false;
  String searchKey = "";
  Future<void> getData() async {
    try {
      searchResult = (await SearchService(searchKey: searchKey).getSearchData());
      notifyListeners();
    } catch (e) {
      print("search provider: $e");
    }
  }
}