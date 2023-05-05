import 'package:caldal/data/model/request/allmeds_repo.dart';
import 'package:caldal/data/model/response/allmeds_model.dart';
import 'package:flutter/widgets.dart';

class AllMedsProvider with ChangeNotifier{
  AllMedsRepo allMedsRepo = AllMedsRepo();

  List<AllMedsModel> _allMedsList = [];
  List<AllMedsModel> get allMedsList => _allMedsList;

  getAllMidsListData() async{
    _allMedsList = await allMedsRepo.getAllMedsListData();
    notifyListeners();
  }
}