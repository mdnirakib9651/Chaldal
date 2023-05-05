

import 'package:caldal/data/provider/allmeds_provider.dart';
import 'package:caldal/data/provider/pharmacy_categories_provider.dart';
import 'package:caldal/data/provider/popular_provider.dart';
import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/style/lato_styles.dart';
import 'package:caldal/view/screen/Product%20Details/popular_details.dart';
import 'package:caldal/view/screen/categories/categories.dart';
import 'package:caldal/view/screen/view%20page/popular_view_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/provider/story_provider.dart';

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
    Provider.of<StoryProvider>(context, listen: false).getStoryListData();
    Provider.of<PharmacyCategoriesProvider>(context, listen: false).getPharmacyCategoriesListData();
    Provider.of<PopularProvider>(context, listen: false).getPopularListData();
    Provider.of<AllMedsProvider>(context, listen: false).getAllMidsListData();
  }

  List imageList = [
    {'id': 1, 'image_path': "assets/images/pharmacy_slide1.jpg"},
    {'id': 2, 'image_path': "assets/images/pharmacy_slide2.jpg"},
    {'id': 3, 'image_path': "assets/images/pharmacy_slide3.jpg"},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                // print(currentIndex);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CarouselSlider(
                    items: imageList.map(
                          (item) => Image.asset(
                        item['image_path'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ).toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason){
                          setState(() {
                            currentIndex = index;
                          });
                        }
                    )),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry){
                // print(entry);
                // print(entry.key);
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currentIndex == entry.key? 17 : 7,
                    height: 7,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == entry.key
                            ? ColorResources.black : ColorResources.grey
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 15,),
            Consumer<PharmacyCategoriesProvider>(builder: (context, pharmacyCategoriesItem, child){
              return pharmacyCategoriesItem.pharmacyCatagoriesList.isNotEmpty
                  ? SizedBox(
                  height: MediaQuery.of(context).size.height - 650,
                  width: MediaQuery.of(context).size.width,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll){
                      overScroll.disallowIndicator();
                      return true;
                    },
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
                              color: pharmacyCategoriesItem.pharmacyCatagoriesList[index].color,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 50,
                                      left: 0,
                                      bottom: 50,
                                      child: Text("${pharmacyCategoriesItem.pharmacyCatagoriesList[index].title}", style: latoRegular.copyWith(color: ColorResources.lightSkyBlue2, fontWeight: FontWeight.bold, fontSize: 14),)),
                                  Positioned(
                                      top: 0,
                                      right: -10,
                                      bottom: -60,
                                      child: Image.asset("${pharmacyCategoriesItem.pharmacyCatagoriesList[index].image}", height: 130, width: 130,))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
                  Consumer<AllMedsProvider>(builder: (context, allMedsItem, child){
                    return allMedsItem.allMedsList.isNotEmpty
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
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => PopularDetails(popularModel: allMedsItem.allMedsList[index],)));
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
                                                      child: Image.asset("${allMedsItem.allMedsList[index].image}",),
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
                                            Text("\$${allMedsItem.allMedsList[index].price}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
                                            const SizedBox(height: 5,),
                                            Text("${allMedsItem.allMedsList[index].productName}", style: latoBold.copyWith(color: Colors.black, fontSize: 17, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${allMedsItem.allMedsList[index].width}", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
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
          ],
        ),
      ),
    );
  }
}
