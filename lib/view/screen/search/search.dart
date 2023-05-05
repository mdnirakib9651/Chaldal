import 'package:caldal/utill/font_size/dimensions.dart';
import 'package:caldal/utill/images.dart';
import 'package:caldal/utill/style/lato_styles.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(Images.search, height: 200, width: 200,),
                ],
              ),
              Text("Search for your desired products", style: latoBold.copyWith(color: Colors.grey, fontSize: 22),),
              Text("(e.g. eggs, milk)", style: latoBold.copyWith(color: Colors.grey, fontSize: 22),)
            ],
          ),
          Expanded(child: Container()),
          Column(
            children: [
              const Divider(height: 1, color: Colors.grey,),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    const InkWell(
                        child: Icon(Icons.arrow_back, color: Colors.black, size: 30,)),
                    const SizedBox(width: 6,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: searchController,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: "Search Products",
                              contentPadding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                              hintStyle: latoRegular.copyWith(fontSize: 17),
                              prefixIcon: const Icon(Icons.search, color: Colors.black,),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.2),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                              ),
                            ),
                            cursorColor: Colors.grey,
                            cursorHeight: 70,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
            ],
          )
        ],
      ),
    );
  }
}
