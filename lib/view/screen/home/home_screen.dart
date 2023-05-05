import 'package:caldal/data/provider/story_provider.dart';
import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/font_size/dimensions.dart';
import 'package:caldal/utill/style/lato_styles.dart';
import 'package:caldal/view/screen/TabBar%20screen/Pharmacy.dart';
import 'package:caldal/view/screen/TabBar%20screen/grocery.dart';
import 'package:caldal/view/screen/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utill/images.dart';

class HomeScreen extends StatefulWidget {
  final int pageIndex;
  const HomeScreen({Key? key, this.pageIndex = 0}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late PageController pageController;
  int _pageIndex = 0;

  late ScrollController controller;

  var isChange = "Grocery";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageIndex = widget.pageIndex;
    pageController = PageController(initialPage: _pageIndex);
    controller = ScrollController();
    final storyMdl = Provider.of<StoryProvider>(context, listen: false);
    storyMdl.getStoryListData();
  }

  void _setPage(int pageIndex) {
    setState(() {
      pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }

  late final List<Widget> _screens = [
    const GroceryScreen(),
    const Phamacy(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> froodTitle = ['Grocery','Phamacy','Cookups'];
    final List<String> froodImage = [Images.grocery, Images.pharmacy, Images.cookUp];
    // final List<String> froodColor = ["${Colors.white}", "${ColorResources.deepPurpleAccent}", "${ColorResources.harlequin}"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: Builder(
          builder: (BuildContext context){
            return InkWell(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(Images.menu, height: 45, width: 45,),
              ),
            );
          },
        ),
        title: Row(
          children: [
            Image.asset(Images.gps, color: ColorResources.deepPurpleAccent, height: 30, width: 30,),
            const SizedBox(width: 8,),
            Text("Dhaka", style: latoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),)
          ],
        ),
      ),
      drawer: const AppDrawer(),
      body: Consumer<StoryProvider>(builder: (context, frood, child){
        return frood.storyList.isNotEmpty
            ? Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: froodTitle.length,
                      itemBuilder: (BuildContext context, int index){
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    frood.communityPreferenceButton(index, true);
                                    _setPage(index);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 115,
                                    decoration: frood.communityPreferenceList == index ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorResources.yellow900
                                    ) : BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: ColorResources.grey, width: 1)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                color: frood.communityPreferenceList == index ? Colors.white : ColorResources.deepPurpleAccent
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Image.asset(froodImage[index],),
                                            ),
                                          ),
                                          const SizedBox(width: 8,),
                                          Text(froodTitle[index], style: latoBold.copyWith(fontSize: Dimensions.fontSizeDefault),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,)
                              ],
                            ),
                          ],
                        );
                      }),
                ),
                Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: _screens.length,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index){
                        return _screens[index];
                      },
                      onPageChanged: (i){
                        frood.communityPreferenceButton(i, true);
                      },
                    )),
              ],
            ),
          ),
        ) : const SizedBox();
      }),
    );
  }
}
