import 'package:caldal/data/model/response/categories_model.dart';
import 'package:flutter/widgets.dart';

import '../model/request/categories_repo.dart';

class CategoriesProvider with ChangeNotifier{
  CategoriesRepo categoriesRepo = CategoriesRepo();

  List<CategoriesModel> _categoriesList = [];
  List<CategoriesModel> get categoriesList => _categoriesList;

  getCategoriesListData() async{
    _categoriesList = await categoriesRepo.getCategoriesListData();
    notifyListeners();
  }
}