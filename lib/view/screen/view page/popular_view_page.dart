import 'package:caldal/data/provider/popular_provider.dart';
import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/images.dart';
import 'package:caldal/utill/style/lato_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularViewPage extends StatefulWidget {
  const PopularViewPage({Key? key}) : super(key: key);

  @override
  State<PopularViewPage> createState() => _PopularViewPageState();
}

class _PopularViewPageState extends State<PopularViewPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PopularProvider>(context, listen: false).getPopularListData();
  }

  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        elevation: 1.5,
        leading: const Icon(Icons.arrow_back, color: Colors.black,),
        title: Text("Popular", style: latoBold.copyWith(color: Colors.black, fontSize: 18),),
        actions: [
          InkWell(
            onTap: (){
              setState(() {
                isClick = !isClick;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
              child: Container(
                height: 50,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple.withOpacity(0.2)
                ),
                child: Center(child: Icon(isClick ? Icons.list : Icons.dashboard_outlined, color: Colors.deepPurple,),),
              ),
            ),
          )
        ],
      ),
      body: Consumer<PopularProvider>(builder: (context, popularItem, child){
        return Padding(
          padding: const EdgeInsets.all(15),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll){
              overScroll.disallowIndicator();
              return true;
            },
            child: isClick
                ? ListView.builder(
              itemCount: popularItem.popularList.length,
                itemBuilder: (BuildContext context, int index){
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.asset("${popularItem.popularList[index].image}"),
                              )
                          ),
                          const SizedBox(width: 15,),
                          SizedBox(
                            height: 70,
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.5,
                                    child: Text("${popularItem.popularList[index].productName}", style: latoBold.copyWith(color: Colors.black, fontSize: 20, overflow: TextOverflow.ellipsis), maxLines: 1,)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("\$${popularItem.popularList[index].price}", style: latoBold.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                                        const SizedBox(width: 5,),
                                        Container(width: 1, height: 12, color: Colors.black,),
                                        const SizedBox(width: 5,),
                                        Text("${popularItem.popularList[index].width}", style: latoRegular.copyWith(color: Colors.black, fontSize: 16),),
                                        const SizedBox(width: 10,),
                                        const Icon(Icons.power, size: 16, color: Colors.grey,),
                                      ],
                                    ),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.deepPurple.withOpacity(0.2)
                                      ),
                                      child: const Center(child: Icon(Icons.add, color: Colors.deepPurple,),),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Divider(color: Colors.grey.withOpacity(0.2), height: 1,),
                      const SizedBox(height: 10,),
                    ],
                  );
                })
                : GridView.builder(
                itemCount: popularItem.popularList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 200,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                ),
                itemBuilder: (BuildContext context, int index){
                  return popularItem.popularList.isNotEmpty
                      ? SizedBox(
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
                                      child: Image.asset("${popularItem.popularList[index].image}"),
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
                }),
          ),
        );
      },)
    );
  }
}
