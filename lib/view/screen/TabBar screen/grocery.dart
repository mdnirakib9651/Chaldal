import 'package:caldal/data/provider/categories_provider.dart';
import 'package:caldal/data/provider/flash_sales_provider.dart';
import 'package:caldal/data/provider/popular_provider.dart';
import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/font_size/dimensions.dart';
import 'package:caldal/view/screen/Product%20Details/popular_details.dart';
import 'package:caldal/view/screen/categories/categories.dart';
import 'package:caldal/view/screen/view%20page/popular_view_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/provider/story_provider.dart';
import '../../../utill/style/lato_styles.dart';
import 'story_view.dart';

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
    Provider.of<StoryProvider>(context, listen: false).getStoryListData();
    Provider.of<CategoriesProvider>(context, listen: false).getCategoriesListData();
    Provider.of<PopularProvider>(context, listen: false).getPopularListData();
    Provider.of<FlashSalesProvider>(context, listen: false).getFlashSalesListData();
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
                // height: 100,
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
                    height: MediaQuery.of(context).size.height - 650,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
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
                                    top: 0,
                                      right: -10,
                                      bottom: -20,
                                      child: Image.asset("${categories.categoriesList[index].image}", height: 120, width: 120,))
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
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Categories()));
                },
                  child: Text("All Categories", style: latoBold.copyWith(color: Colors.deepPurple, fontSize: 20),)),
              const SizedBox(height: 10,),
              /// ----------------->>>>>>>> Popular <<<<<<<<<<<<<<--------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PopularViewPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("View more", style: latoBold.copyWith(color: Colors.deepPurpleAccent, fontSize: 16),),
                        const Icon(Icons.navigate_next, color: Colors.deepPurpleAccent, size: 18,)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<PopularProvider>(builder: (context, popularItem, child){
                      return popularItem.popularList.isNotEmpty
                          ? SizedBox(
                        height: 220,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  InkWell(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PopularDetails(popularModel: popularItem.popularList[index],)));
                                    },
                                    child: SizedBox(
                                      height: 220,
                                      width: 120,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  const SizedBox(height: 120, width: 120,),
                                                  Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8),
                                                      child: Image.asset("${popularItem.popularList[index].image}",),
                                                    )
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    child: Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(100),
                                                        border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                        color: ColorResources.white,
                                                      ),
                                                      child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text("\$${popularItem.popularList[index].price}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                              const SizedBox(height: 5,),
                                              Text("${popularItem.popularList[index].productName}", style: latoBold.copyWith(color: Colors.black, fontSize: 17, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${popularItem.popularList[index].width}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                              const Icon(Icons.power, size: 16, color: Colors.grey,)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      )
                          : SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$112", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("Teer Sugar", style: latoBold.copyWith(color: Colors.black, fontSize: 18),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("1kg", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      );
                    })
                  ],
                ),
              ),
              /// --------------->>>>>>>>>>>>> Flash Sales <<<<<<<<<<<<<<<<<--------------------
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Flash Sales", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PopularViewPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("View more", style: latoBold.copyWith(color: Colors.deepPurpleAccent, fontSize: 16),),
                        const Icon(Icons.navigate_next, color: Colors.deepPurpleAccent, size: 18,)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<FlashSalesProvider>(builder: (context, flashSalesItem, child){
                      return flashSalesItem.flashSalesList.isNotEmpty
                          ? SizedBox(
                        height: 220,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 220,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8),
                                                      child: Image.asset("${flashSalesItem.flashSalesList[index].image}",),
                                                    )
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$${flashSalesItem.flashSalesList[index].price}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("${flashSalesItem.flashSalesList[index].productName}", style: latoBold.copyWith(color: Colors.black, fontSize: 17, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${flashSalesItem.flashSalesList[index].width}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      )
                          : SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$112", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("Teer Sugar", style: latoBold.copyWith(color: Colors.black, fontSize: 18),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("1kg", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      );
                    })
                  ],
                ),
              ),
              /// --------------->>>>>>>>>>>>> Flash Vegetables <<<<<<<<<<<<<<<<<--------------------
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Flash Vegetables", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PopularViewPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("View more", style: latoBold.copyWith(color: Colors.deepPurpleAccent, fontSize: 16),),
                        const Icon(Icons.navigate_next, color: Colors.deepPurpleAccent, size: 18,)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<PopularProvider>(builder: (context, popularItem, child){
                      return popularItem.popularList.isNotEmpty
                          ? SizedBox(
                        height: 220,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 220,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8),
                                                      child: Image.asset("${popularItem.popularList[index].image}",),
                                                    )
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$${popularItem.popularList[index].price}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("${popularItem.popularList[index].productName}", style: latoBold.copyWith(color: Colors.black, fontSize: 17, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${popularItem.popularList[index].width}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      )
                          : SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$112", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("Teer Sugar", style: latoBold.copyWith(color: Colors.black, fontSize: 18),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("1kg", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      );
                    })
                  ],
                ),
              ),
              /// --------------->>>>>>>>>>>>> Biscuits <<<<<<<<<<<<<<<<<--------------------
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Biscuits", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PopularViewPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("View more", style: latoBold.copyWith(color: Colors.deepPurpleAccent, fontSize: 16),),
                        const Icon(Icons.navigate_next, color: Colors.deepPurpleAccent, size: 18,)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<FlashSalesProvider>(builder: (context, flashSalesItem, child){
                      return flashSalesItem.flashSalesList.isNotEmpty
                          ? SizedBox(
                        height: 220,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 220,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8),
                                                      child: Image.asset("${flashSalesItem.flashSalesList[index].image}",),
                                                    )
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$${flashSalesItem.flashSalesList[index].price}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("${flashSalesItem.flashSalesList[index].productName}", style: latoBold.copyWith(color: Colors.black, fontSize: 17, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${flashSalesItem.flashSalesList[index].width}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      )
                          : SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$112", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("Teer Sugar", style: latoBold.copyWith(color: Colors.black, fontSize: 18),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("1kg", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      );
                    })
                  ],
                ),
              ),
              /// --------------->>>>>>>>>>>>> Salt & Sugar <<<<<<<<<<<<<<<<<--------------------
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Salt & Sugar", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PopularViewPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("View more", style: latoBold.copyWith(color: Colors.deepPurpleAccent, fontSize: 16),),
                        const Icon(Icons.navigate_next, color: Colors.deepPurpleAccent, size: 18,)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<PopularProvider>(builder: (context, popularItem, child){
                      return popularItem.popularList.isNotEmpty
                          ? SizedBox(
                        height: 220,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 220,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8),
                                                      child: Image.asset("${popularItem.popularList[index].image}",),
                                                    )
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$${popularItem.popularList[index].price}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("${popularItem.popularList[index].productName}", style: latoBold.copyWith(color: Colors.black, fontSize: 17, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${popularItem.popularList[index].width}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      )
                          : SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$112", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("Teer Sugar", style: latoBold.copyWith(color: Colors.black, fontSize: 18),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("1kg", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      );
                    })
                  ],
                ),
              ),
              /// --------------->>>>>>>>>>>>> Flash Fruits <<<<<<<<<<<<<<<<<--------------------
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Flash Fruits", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PopularViewPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("View more", style: latoBold.copyWith(color: Colors.deepPurpleAccent, fontSize: 16),),
                        const Icon(Icons.navigate_next, color: Colors.deepPurpleAccent, size: 18,)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<FlashSalesProvider>(builder: (context, flashSalesItem, child){
                      return flashSalesItem.flashSalesList.isNotEmpty
                          ? SizedBox(
                        height: 220,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 220,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8),
                                                      child: Image.asset("${flashSalesItem.flashSalesList[index].image}",),
                                                    )
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$${flashSalesItem.flashSalesList[index].price}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("${flashSalesItem.flashSalesList[index].productName}", style: latoBold.copyWith(color: Colors.black, fontSize: 17, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${flashSalesItem.flashSalesList[index].width}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      )
                          : SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$112", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("Teer Sugar", style: latoBold.copyWith(color: Colors.black, fontSize: 18),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("1kg", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      );
                    })
                  ],
                ),
              ),
              /// --------------->>>>>>>>>>>>> Flash Vegetables <<<<<<<<<<<<<<<<<--------------------
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Noodles", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PopularViewPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("View more", style: latoBold.copyWith(color: Colors.deepPurpleAccent, fontSize: 16),),
                        const Icon(Icons.navigate_next, color: Colors.deepPurpleAccent, size: 18,)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<PopularProvider>(builder: (context, popularItem, child){
                      return popularItem.popularList.isNotEmpty
                          ? SizedBox(
                        height: 220,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 220,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8),
                                                      child: Image.asset("${popularItem.popularList[index].image}",),
                                                    )
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$${popularItem.popularList[index].price}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("${popularItem.popularList[index].productName}", style: latoBold.copyWith(color: Colors.black, fontSize: 17, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${popularItem.popularList[index].width}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      )
                          : SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$112", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("Teer Sugar", style: latoBold.copyWith(color: Colors.black, fontSize: 18),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("1kg", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      );
                    })
                  ],
                ),
              ),
              /// --------------->>>>>>>>>>>>> Oil <<<<<<<<<<<<<<<<<--------------------
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Oil", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PopularViewPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("View more", style: latoBold.copyWith(color: Colors.deepPurpleAccent, fontSize: 16),),
                        const Icon(Icons.navigate_next, color: Colors.deepPurpleAccent, size: 18,)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<FlashSalesProvider>(builder: (context, flashSalesItem, child){
                      return flashSalesItem.flashSalesList.isNotEmpty
                          ? SizedBox(
                        height: 220,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 220,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8),
                                                      child: Image.asset("${flashSalesItem.flashSalesList[index].image}",),
                                                    )
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$${flashSalesItem.flashSalesList[index].price}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("${flashSalesItem.flashSalesList[index].productName}", style: latoBold.copyWith(color: Colors.black, fontSize: 17, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${flashSalesItem.flashSalesList[index].width}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      )
                          : SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index){
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                const SizedBox(height: 120, width: 120,),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(width: 1, color: Colors.deepPurpleAccent),
                                                      color: ColorResources.white,
                                                    ),
                                                    child: const Icon(Icons.add, color: Colors.deepPurpleAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("\$112", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("Teer Sugar", style: latoBold.copyWith(color: Colors.black, fontSize: 18),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("1kg", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const Icon(Icons.power, size: 16, color: Colors.grey,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              );
                            }),
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ): const Center(child: CircularProgressIndicator(),);
    });
  }
}
