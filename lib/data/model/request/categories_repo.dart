import 'package:caldal/data/model/response/categories_model.dart';
import 'package:caldal/utill/color_resources.dart';

class CategoriesRepo{
  List<CategoriesModel> categoriesList = [
    CategoriesModel(1, "Ramadan", ColorResources.category1),
    CategoriesModel(2, "Popular", ColorResources.category2),
    CategoriesModel(3, "Flash Sales", ColorResources.category3),
    CategoriesModel(4, "Food", ColorResources.category4),
  ];
  Future<List<CategoriesModel>> getCategoriesListData() async{
    return categoriesList;
  }
}