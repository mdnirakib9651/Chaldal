import 'package:caldal/data/model/request/popular_repo.dart';
import 'package:caldal/data/model/response/popular_model.dart';
import 'package:flutter/cupertino.dart';

class PopularProvider with ChangeNotifier{
  PopularRepo popularRepo = PopularRepo();

  List<PopularModel> _popularList = [];
  List<PopularModel> get popularList => _popularList;

  getPopularListData() async{
    _popularList = await popularRepo.getPopularListData();
    notifyListeners();
  }
}