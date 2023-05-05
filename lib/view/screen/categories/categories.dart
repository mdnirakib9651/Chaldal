import 'package:caldal/data/provider/categories_provider.dart';
import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/style/lato_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategoriesListData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        elevation: 1,
        leading: const Icon(Icons.arrow_back, color: Colors.black,),
        title: Text("Categories", style: latoRegular.copyWith(color: Colors.black, fontSize: 18),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll){
            overScroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Consumer<CategoriesProvider>(builder: (context, categories, child){
                  return categories.categoriesList.isNotEmpty
                      ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
