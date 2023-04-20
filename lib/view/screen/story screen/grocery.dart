import 'package:caldal/data/provider/categories_provider.dart';
import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/font_size/dimensions.dart';
import 'package:caldal/utill/images.dart';
import 'package:caldal/view/screen/story%20screen/story_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/provider/story_provider.dart';
import '../../../utill/style/lato_styles.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final storyMdl = Provider.of<StoryProvider>(context, listen: false);
    storyMdl.getStoryListData();
    Provider.of<CategoriesProvider>(context, listen: false).getCategoriesListData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoryProvider>(builder: (context, frood, child){
      return frood.storyList.isNotEmpty
          ? NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll){
          overScroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 190,
                      width: MediaQuery.of(context).size.width - 20,
                      child: ListView.builder(
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: frood.storyList.length,
                          itemBuilder: (BuildContext context, int index){
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => StoryView(storyModel: frood.storyList[index],)));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image(
                                        height: 190,
                                        width: 100,
                                        image: AssetImage("${frood.storyList[index].image}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 10.0,
                                      left: 10.0,
                                      child: Text("${frood.storyList[index].title}", style: latoBold.copyWith(
                                          fontSize: Dimensions.fontSizeDefault,
                                          color: ColorResources.white
                                      ),)
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue.withOpacity(0.2)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Daily Deals", style: latoBold.copyWith(color: ColorResources.lightSkyBlue2, fontWeight: FontWeight.bold, fontSize: 20),),
                          Container(
                            height: 28,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Center(child: Text("07h:53m:37s", style: latoBold.copyWith(color: ColorResources.lightSkyBlue2, fontWeight: FontWeight.bold, fontSize: 16),)),
                          )
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order over 99 to activate", style: latoRegular.copyWith(color: ColorResources.lightSkyBlue2, fontWeight: FontWeight.bold, fontSize: 14),),
                              Text("Limited Stock", style: latoRegular.copyWith(color: ColorResources.lightSkyBlue2, fontWeight: FontWeight.bold, fontSize: 14),),
                            ],
                          ),
                          InkWell(
                              onTap: (){},
                              child: const Icon(Icons.navigate_next))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Consumer<CategoriesProvider>(builder: (context, categories, child){
                return categories.categoriesList.isNotEmpty
                    ? SizedBox(
                    height: MediaQuery.of(context).size.height - 330,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      itemCount: categories.categoriesList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 120,
                      ),
                      itemBuilder: (BuildContext context, int index){
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: (){
                            // Get.to(SneokersScreen(sneokersModel: object.sneokersList[index]));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: categories.categoriesList[index].color,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 50,
                                      left: 0,
                                      bottom: 50,
                                      child: Text("${categories.categoriesList[index].title}", style: latoRegular.copyWith(color: ColorResources.lightSkyBlue2, fontWeight: FontWeight.bold, fontSize: 14),)),
                                  Positioned(
                                    top: 50,
                                      right: 0,
                                      bottom: 0,
                                      child: Image.asset(Images.ramadan))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                ) : const Center(child: CircularProgressIndicator(),);
              }),
              const SizedBox(height: 10,),
              Row(
                children: [

                ],
              )
            ],
          ),
        ),
      ): const Center(child: CircularProgressIndicator(),);
    });
  }
}
