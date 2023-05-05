
import 'package:caldal/data/model/request/self_sugar_repo.dart';
import 'package:caldal/data/model/response/self_sugar_model.dart';
import 'package:flutter/cupertino.dart';

class SeltSugarProvider with ChangeNotifier{
  SeltSugarRepo seltSugarRepo = SeltSugarRepo();

  List<SaltSugarModel> _seltSugarList = [];
  List<SaltSugarModel> get seltSugarList => _seltSugarList;

  getSeltSugarListData() async{
    _seltSugarList = await seltSugarRepo.getSeltSugarListData();
    notifyListeners();
  }

}