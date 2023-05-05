import 'package:caldal/data/model/response/popular_model.dart';
import 'package:caldal/utill/images.dart';

class PopularRepo{
  List<PopularModel> popularList = [
    PopularModel(1, Images.teerSugar, "Teer Sugar", "112", "1kg"),
    PopularModel(2, Images.basicDishwashin, "Chaldal Basic Dishwashing Bar", "35", "300gm"),
    PopularModel(3, Images.premiumBeef, "Chaldal Premium Beer Mixed Vut Bone In 50gm", "829", "1kg"),
    PopularModel(4, Images.bashundharaToiletTissue, "Bashundgara Toilet Tissue", "100", "4pcs"),
    PopularModel(5, Images.chickenEggs, "Chicken Eggs", "135", "12pcs"),
    PopularModel(6, Images.deshiPeyaj, "Deshi Peyaj(Local Onion 50gm)", "49", "1kg"),
    PopularModel(7, Images.potato, "Potato Regular (50gm)", "35", "1kg"),
    PopularModel(8, Images.redTomato, "Red Tomato 25gm", "25", "500gm"),
    PopularModel(9, Images.corianderLeaves, "Coriander Leaves(Dhonia Pata)", "19", "100gm"),
    PopularModel(10, Images.kachaMorich, "Green Chili(12gm)", "25", "250gm"),
    PopularModel(1, Images.teerSugar, "Teer Sugar", "112", "1kg"),
    PopularModel(2, Images.basicDishwashin, "Chaldal Basic Dishwashing Bar", "35", "300gm"),
    PopularModel(3, Images.premiumBeef, "Chaldal Premium Beer Ribs 50gm", "829", "1kg"),
    PopularModel(4, Images.bashundharaToiletTissue, "Bashundgara Toilet Tissue", "100", "4pcs"),
    PopularModel(5, Images.chickenEggs, "Chicken Eggs", "135", "12pcs"),
    PopularModel(6, Images.deshiPeyaj, "Deshi Peyaj(Local Onion 50gm)", "49", "1kg"),
    PopularModel(7, Images.potato, "Potato Regular (50gm)", "35", "1kg"),
    PopularModel(8, Images.redTomato, "Red Tomato 25gm", "25", "500gm"),
    PopularModel(9, Images.corianderLeaves, "Coriander Leaves(Dhonia Pata)", "19", "100gm"),
    PopularModel(10, Images.kachaMorich, "Green Chili(12gm)", "25", "250gm"),
    PopularModel(1, Images.teerSugar, "Teer Sugar", "112", "1kg"),
    PopularModel(2, Images.basicDishwashin, "Chaldal Basic Dishwashing Bar", "35", "300gm"),
    PopularModel(3, Images.premiumBeef, "Chaldal Premium Beer Ribs 50gm", "829", "1kg"),
    PopularModel(4, Images.bashundharaToiletTissue, "Bashundgara Toilet Tissue", "100", "4pcs"),
    PopularModel(5, Images.chickenEggs, "Chicken Eggs", "135", "12pcs"),
    PopularModel(6, Images.deshiPeyaj, "Deshi Peyaj(Local Onion 50gm)", "49", "1kg"),
    PopularModel(7, Images.potato, "Potato Regular (50gm)", "35", "1kg"),
    PopularModel(8, Images.redTomato, "Red Tomato 25gm", "25", "500gm"),
    PopularModel(9, Images.corianderLeaves, "Coriander Leaves(Dhonia Pata)", "19", "100gm"),
    PopularModel(10, Images.kachaMorich, "Green Chili(12gm)", "25", "250gm"),
  ];

  Future<List<PopularModel>> getPopularListData() async{
    return popularList;
  }
}