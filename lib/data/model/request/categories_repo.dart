import 'package:caldal/data/model/response/categories_model.dart';
import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/images.dart';

class CategoriesRepo{
  List<CategoriesModel> categoriesList = [
    CategoriesModel(1, "Popular", ColorResources.category1, Images.popularGrid),
    CategoriesModel(2, "Flash Sales", ColorResources.category2, Images.flashSalesGrid),
    CategoriesModel(3, "Food", ColorResources.category3, Images.foodGrid),
    CategoriesModel(3, "Cleaning Supplies", ColorResources.category4, Images.cleaningSupplies),
    CategoriesModel(1, "Popular", ColorResources.category1, Images.popularGrid),
    CategoriesModel(2, "Flash Sales", ColorResources.category2, Images.flashSalesGrid),
    CategoriesModel(3, "Food", ColorResources.category3, Images.foodGrid),
    CategoriesModel(3, "Cleaning Supplies", ColorResources.category4, Images.cleaningSupplies),
    CategoriesModel(1, "Popular", ColorResources.category1, Images.popularGrid),
    CategoriesModel(2, "Flash Sales", ColorResources.category2, Images.flashSalesGrid),
    CategoriesModel(3, "Food", ColorResources.category3, Images.foodGrid),
    CategoriesModel(3, "Cleaning Supplies", ColorResources.category4, Images.cleaningSupplies),
    CategoriesModel(1, "Popular", ColorResources.category1, Images.popularGrid),
    CategoriesModel(2, "Flash Sales", ColorResources.category2, Images.flashSalesGrid),
    CategoriesModel(3, "Food", ColorResources.category3, Images.foodGrid),
    CategoriesModel(3, "Cleaning Supplies", ColorResources.category4, Images.cleaningSupplies),
  ];
  Future<List<CategoriesModel>> getCategoriesListData() async{
    return categoriesList;
  }
}