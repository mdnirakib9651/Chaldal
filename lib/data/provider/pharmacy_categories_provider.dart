import 'package:caldal/data/model/request/pharmacy_catagories_repo.dart';
import 'package:caldal/data/model/response/pharmacy_categories_model.dart';
import 'package:flutter/cupertino.dart';

class PharmacyCategoriesProvider with ChangeNotifier{
  PharmacyCategoriesRepo pharmacyCategoriesRepo = PharmacyCategoriesRepo();

  List<PharmacyCatagoriesModel> _pharmacyCatagoriesList = [];
  List<PharmacyCatagoriesModel> get pharmacyCatagoriesList => _pharmacyCatagoriesList;

  getPharmacyCategoriesListData() async{
    _pharmacyCatagoriesList = await pharmacyCategoriesRepo.getPharmacyCategoriesListData();
    notifyListeners();
  }
}