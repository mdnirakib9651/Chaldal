
import 'package:caldal/data/model/response/fresh_vegetables_model.dart';
import 'package:flutter/cupertino.dart';

class FreshVegetablesProvider with ChangeNotifier{
  FreshVegetablesProvider freshVegetables = FreshVegetablesProvider();

  List<FreshVegetablesModel> _freshVegetablesList = [];
  List<FreshVegetablesModel> get freshVegetablesList => _freshVegetablesList;

  getFreshVegetablesListData() async{
    _freshVegetablesList = await freshVegetables.getFreshVegetablesListData();
    notifyListeners();
  }

}