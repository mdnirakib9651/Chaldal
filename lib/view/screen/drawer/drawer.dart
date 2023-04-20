import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/style/lato_styles.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String eggClub = "Egg Club";
  String allStores = " All Stores";
  String offers = " Offers";
  String dailyDeals = " Daily Deals";
  String isClick = "Egg Club";
  String help = " Help";
  String customSupport = " Customer Support";
  String liveChat = " Live Chat";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorResources.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 2, color: Colors.deepPurpleAccent),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                  child: const Icon(Icons.person, color: Colors.deepPurpleAccent, size: 50,)),
            ),
            const SizedBox(height: 8,),
            Text("Login", style: latoBold.copyWith(color: ColorResources.deepPurpleAccent, fontSize: 20),),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                isClick = eggClub;
                setState(() {

                });
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: isClick == eggClub ?
                BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: Colors.grey,
                    border: Border.all(width: 1, color: Colors.grey.withOpacity(.3))
                ) : const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.egg, color: Colors.amberAccent, size: 30,),
                          Text(eggClub, style: latoBold.copyWith(fontSize: 17, color: Colors.black),)
                        ],
                      ),
                      const Icon(Icons.navigate_next, color: Colors.grey,)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                isClick = allStores;
                setState(() {

                });
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: isClick == allStores ?
                BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: Colors.grey,
                    border: Border.all(width: 1, color: Colors.grey.withOpacity(.3))
                )
                : const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.history, color: Colors.redAccent, size: 26,),
                          Text(allStores, style: latoBold.copyWith(fontSize: 17, color: Colors.black),)
                        ],
                      ),
                      const Icon(Icons.navigate_next, color: Colors.grey,)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                isClick = offers;
                setState(() {

                });
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: isClick == offers ?
                BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: Colors.grey,
                    border: Border.all(width: 1, color: Colors.grey.withOpacity(.3))
                )
                    : const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.local_offer, color: Colors.blue, size: 26,),
                          Text(offers, style: latoBold.copyWith(fontSize: 17, color: Colors.black),)
                        ],
                      ),
                      const Icon(Icons.navigate_next, color: Colors.grey,)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Divider(height: 2, color: Colors.grey.withOpacity(.5),),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                isClick = dailyDeals;
                setState(() {

                });
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: isClick == dailyDeals ?
                BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: Colors.grey,
                    border: Border.all(width: 1, color: Colors.grey.withOpacity(.3))
                )
                    : const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.shopping_bag_outlined, color: Colors.indigoAccent, size: 30,),
                          Text(dailyDeals, style: latoBold.copyWith(fontSize: 17, color: Colors.black),)
                        ],
                      ),
                      const Icon(Icons.navigate_next, color: Colors.grey,)
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const Icon(Icons.help_outline, color: Colors.deepPurpleAccent, size: 26,),
                      Text(help, style: latoBold.copyWith(fontSize: 17, color: Colors.black),)
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const Icon(Icons.call, color: Colors.deepPurpleAccent, size: 26,),
                      Text(customSupport, style: latoBold.copyWith(fontSize: 17, color: Colors.black),)
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const Icon(Icons.chat_outlined, color: Colors.deepPurpleAccent, size: 26,),
                      Text(liveChat, style: latoBold.copyWith(fontSize: 17, color: Colors.black),)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
