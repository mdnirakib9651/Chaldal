
import 'package:caldal/data/model/response/pharmacy_categories_model.dart';
import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/images.dart';

class PharmacyCategoriesRepo{
  List<PharmacyCatagoriesModel> pharmacyCategoriesList = [
    PharmacyCatagoriesModel(1, "Common Conditions", ColorResources.category1, Images.commonConditions),
    PharmacyCatagoriesModel(2, "Sexual Wellness", ColorResources.category2, Images.sexualWellness),
    PharmacyCatagoriesModel(3, "Birth Control Contra", ColorResources.category3, Images.birthController),
    PharmacyCatagoriesModel(4, "Vitamins & Supplements", ColorResources.category4, Images.vitaminsSupplements),
  ];
  Future<List<PharmacyCatagoriesModel>> getPharmacyCategoriesListData() async{
    return pharmacyCategoriesList;
  }
}