import 'package:caldal/data/model/response/biscuits_model.dart';
import 'package:caldal/data/model/response/flash_sales_model.dart';
import 'package:caldal/utill/images.dart';

class BiscuitsRepo{
  List<BiscuitsModel> biscuitsList = [
    BiscuitsModel(1, Images.teerSugar, "Teer Sugar", "112", "1kg"),
    BiscuitsModel(2, Images.basicDishwashin, "Chaldal Basic Dishwashing Bar", "35", "300gm"),
    BiscuitsModel(3, Images.premiumBeef, "Chaldal Premium Beer Mixed Vut Bone In 50gm", "829", "1kg"),
    BiscuitsModel(4, Images.bashundharaToiletTissue, "Bashundgara Toilet Tissue", "100", "4pcs"),
  ];

  Future<List<BiscuitsModel>> getBiscuitsListData() async{
    return biscuitsList;
  }
}