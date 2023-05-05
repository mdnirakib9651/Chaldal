import 'package:caldal/data/model/request/flash_sales_repo.dart';
import 'package:caldal/data/model/response/flash_sales_model.dart';
import 'package:flutter/cupertino.dart';

class FlashSalesProvider with ChangeNotifier{
  FlashSalesRepo flashSalesRepo = FlashSalesRepo();

  List<FlashSalesModel> _flashSalesList = [];
  List<FlashSalesModel> get flashSalesList => _flashSalesList;

  getFlashSalesListData() async{
    _flashSalesList = await flashSalesRepo.getFlashSalesListData();
    notifyListeners();
  }

}