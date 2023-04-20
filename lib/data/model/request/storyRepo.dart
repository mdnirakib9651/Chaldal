import 'package:caldal/data/model/response/story_model.dart';
import 'package:caldal/utill/images.dart';

class StoryRepo{
  List<StoryModel> storyList = [
    StoryModel(1, Images.frood1, "Daily Deals"),
    StoryModel(2, Images.frood2, "Best Price"),
    StoryModel(3, Images.frood3, "Egg Club"),
    StoryModel(4, Images.frood4, "Protein"),
    StoryModel(5, Images.frood5, "Cookups"),
    StoryModel(6, Images.frood6, "Bangla Meds"),
    StoryModel(7, Images.frood7, "Gogo Bangla"),
    StoryModel(8, Images.frood8, "Daily Deals"),
  ];
  Future<List<StoryModel>> getStoryListData() async{
    return storyList;
  }
}