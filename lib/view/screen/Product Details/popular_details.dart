import 'package:caldal/data/model/response/popular_model.dart';
import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/images.dart';
import 'package:caldal/utill/style/lato_styles.dart';
import 'package:flutter/material.dart';

class PopularDetails extends StatefulWidget {
  PopularModel popularModel;
  PopularDetails({Key? key, required this.popularModel}) : super(key: key);

  @override
  State<PopularDetails> createState() => _PopularDetailsState();
}

class _PopularDetailsState extends State<PopularDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        elevation: 1,
        leading: const Icon(Icons.arrow_back, color: Colors.black,),
        title: Text("Product Details", style: latoBold.copyWith(color: Colors.black, fontSize: 16),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.popularModel.productName}", style: latoBold.copyWith(fontSize: 18, color: Colors.black),),
                Image.asset("${widget.popularModel.image}", height: 250, width: MediaQuery.of(context).size.width,),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("\$${widget.popularModel.price}", style: latoBold.copyWith(color: Colors.black, fontSize: 30),),
                        const SizedBox(width: 8,),
                        Container(height: 20, width: 2, color: Colors.black,),
                        const SizedBox(width: 8,),
                        Text("${widget.popularModel.width}", style: latoBold.copyWith(color: Colors.black, fontSize: 20),),
                      ],
                    ),
                    const Icon(Icons.power, size: 22, color: Colors.grey,),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurpleAccent,
                      ),
                      child: Center(child: Text("Buy now", style: latoBold.copyWith(color: Colors.white, fontSize: 16),)),
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
                const SizedBox(height: 15,),
                const Divider(height: 1, color: Colors.black,),
                const SizedBox(height: 15,),
                Text("Introducing our Premium Beef (with bone), sourced from oxen aged 2 to 4 years, this delicacy is the perfect blend of flavor and nutrition. With 100% you can expect tender and juicy cuts of beef with every bite. Experience the richness of well-marbled meat that is sure to elevate your cooking experience. Order now and taste the difference of Premium Beef!", style: latoRegular.copyWith(color: Colors.black, fontSize: 20),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: Text("Close", style: latoBold.copyWith(color: Colors.deepPurpleAccent, fontSize: 22,),)),
                const SizedBox(height: 10,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
