
import 'package:caldal/data/model/response/fresh_vegetables_model.dart';
import 'package:caldal/utill/images.dart';

class FreshVegetables{
  List<FreshVegetablesModel> freshVegetablesList = [
    FreshVegetablesModel(1, Images.teerSugar, "Teer Sugar", "112", "1kg"),
    FreshVegetablesModel(2, Images.basicDishwashin, "Chaldal Basic Dishwashing Bar", "35", "300gm"),
    FreshVegetablesModel(3, Images.premiumBeef, "Chaldal Premium Beer Mixed Vut Bone In 50gm", "829", "1kg"),
    FreshVegetablesModel(4, Images.bashundharaToiletTissue, "Bashundgara Toilet Tissue", "100", "4pcs"),
  ];

  Future<List<FreshVegetablesModel>> getFreshVegetablesListData() async{
    return freshVegetablesList;
  }

}