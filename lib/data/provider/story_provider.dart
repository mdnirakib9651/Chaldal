import 'package:caldal/data/model/request/storyRepo.dart';
import 'package:caldal/data/model/response/story_model.dart';
import 'package:flutter/cupertino.dart';

class StoryProvider with ChangeNotifier{
  StoryRepo storyRepo = StoryRepo();

  List<StoryModel> _storyList = [];
  List<StoryModel> get storyList => _storyList;

  getStoryListData() async{
    _storyList = await storyRepo.getStoryListData();
    notifyListeners();
  }

  int _communityPreferenceList = 0;
  int get communityPreferenceList => _communityPreferenceList;

  void communityPreferenceButton(int index, bool notify) {
    _communityPreferenceList = index;
    if(notify) {
      notifyListeners();
    }
  }

}