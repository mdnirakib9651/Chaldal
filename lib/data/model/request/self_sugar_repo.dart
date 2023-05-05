import 'package:caldal/data/model/response/flash_sales_model.dart';
import 'package:caldal/data/model/response/self_sugar_model.dart';
import 'package:caldal/utill/images.dart';

class SeltSugarRepo{
  List<SaltSugarModel> seltSugarList = [
    SaltSugarModel(1, Images.teerSugar, "Teer Sugar", "112", "1kg"),
    SaltSugarModel(2, Images.basicDishwashin, "Chaldal Basic Dishwashing Bar", "35", "300gm"),
    SaltSugarModel(3, Images.premiumBeef, "Chaldal Premium Beer Mixed Vut Bone In 50gm", "829", "1kg"),
    SaltSugarModel(4, Images.bashundharaToiletTissue, "Bashundgara Toilet Tissue", "100", "4pcs"),
  ];

  Future<List<SaltSugarModel>> getSeltSugarListData() async{
    return seltSugarList;
  }
}