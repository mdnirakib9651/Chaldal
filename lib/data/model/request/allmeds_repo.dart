import 'package:caldal/data/model/response/allmeds_model.dart';
import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/images.dart';

class AllMedsRepo{
  List<AllMedsModel> allMedsList = [
    AllMedsModel(1, Images.aclitolInfalationCapsule400mc, "Aclitol Infaltion Capsule 400mc", "112", "400mc"),
    AllMedsModel(2, Images.azicinTablet250ml, "Azicin Tablet 250ml", "35", "250ml"),
    AllMedsModel(3, Images.aristoplexSyrup200ml, "Aristoplex Syrup 200l", "829", "200ml"),
    AllMedsModel(4, Images.corestinTablet10mg, "Corestin Tablet 10mg", "100", "10mg"),
    AllMedsModel(5, Images.gtnSr2Tablet, "GTN SR 2Tablet", "135", "2pc"),
    AllMedsModel(6, Images.zulfidinTablet500mg, "Zulfidin Tablet 500mg", "49", "500mg"),
    AllMedsModel(7, Images.xenovateOnitment30mg, "Xenobate Onitment 30mg", "35", "30mg"),
    AllMedsModel(8, Images.xenovateOnitment30mg, "Xenovate Onitment 30mg", "25", "30mg"),
    AllMedsModel(9, Images.xenovateCream230mg, "Xenovate Cream2 30mg", "19", "30mg"),
    AllMedsModel(10, Images.xenovateCream230mg, "Xenovate Cream2 20mg", "25", "20mg"),
  ];
  Future<List<AllMedsModel>> getAllMedsListData() async{
    return allMedsList;
  }
}