import 'package:caldal/data/model/response/flash_sales_model.dart';
import 'package:caldal/utill/images.dart';

class FlashSalesRepo{
  List<FlashSalesModel> flashSalesList = [
    FlashSalesModel(1, Images.nestleKitkatClassic, "Nestle KitKat Classic Taste Of Celebration Chocolate Gift Pack", "112", "1kg"),
    FlashSalesModel(2, Images.sunillaSunflowerOil, "Sunilla Sunflower Oil", "35", "300gm"),
    FlashSalesModel(3, Images.amanaFloorCleaner, "Amans Floor Cleaner", "829", "1kg"),
    FlashSalesModel(4, Images.visionRoomComforter, "Vision Room Comforter Easy Room Heater(Black)", "100", "4pcs"),
    FlashSalesModel(3, Images.ministerChaadFabricBrightener, "Minister Chaad Fabric Brightener", "829", "1kg"),
    FlashSalesModel(3, Images.flushBathroomCleaningLiquid, "Flush Bathroom Cleaning Liquid", "829", "1kg"),
    FlashSalesModel(3, Images.flushToitetCleanerCitrunFresh, "Flush Toitet Cleaner Citrun Fresh", "829", "1kg"),
    FlashSalesModel(3, Images.fridayBlackTea, "Friday Black Tea", "829", "1kg"),
    FlashSalesModel(3, Images.parachuteSkinpureSkinLotionNatureWhite, "Parachute Skinpure SkinLotion Nature White", "829", "1kg"),
    FlashSalesModel(1, Images.nestleKitkatClassic, "Nestle KitKat Classic Taste Of Celebration Chocolate Gift Pack", "112", "1kg"),
    FlashSalesModel(2, Images.sunillaSunflowerOil, "Sunilla Sunflower Oil", "35", "300gm"),
    FlashSalesModel(3, Images.amanaFloorCleaner, "Amans Floor Cleaner", "829", "1kg"),
    FlashSalesModel(4, Images.visionRoomComforter, "Vision Room Comforter Easy Room Heater(Black)", "100", "4pcs"),
    FlashSalesModel(3, Images.ministerChaadFabricBrightener, "Minister Chaad Fabric Brightener", "829", "1kg"),
    FlashSalesModel(3, Images.flushBathroomCleaningLiquid, "Flush Bathroom Cleaning Liquid", "829", "1kg"),
    FlashSalesModel(3, Images.flushToitetCleanerCitrunFresh, "Flush Toitet Cleaner Citrun Fresh", "829", "1kg"),
    FlashSalesModel(3, Images.fridayBlackTea, "Friday Black Tea", "829", "1kg"),
    FlashSalesModel(3, Images.parachuteSkinpureSkinLotionNatureWhite, "Parachute Skinpure SkinLotion Nature White", "829", "1kg"),

  ];

  Future<List<FlashSalesModel>> getFlashSalesListData() async{
    return flashSalesList;
  }
}