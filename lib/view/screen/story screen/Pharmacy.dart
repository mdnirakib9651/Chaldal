import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/font_size/dimensions.dart';
import 'package:caldal/view/screen/story%20screen/story_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/provider/story_provider.dart';
import '../../../utill/style/lato_styles.dart';

class Phamacy extends StatefulWidget {
  const Phamacy({Key? key}) : super(key: key);

  @override
  State<Phamacy> createState() => _PhamacyState();
}

class _PhamacyState extends State<Phamacy> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final storyMdl = Provider.of<StoryProvider>(context, listen: false);
    storyMdl.getStoryListData();
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
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                color: Colors.blue,
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
                                borderRadius: BorderRadius.circular(8),
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
      ): const Center(child: CircularProgressIndicator(),);
    });
  }
}
