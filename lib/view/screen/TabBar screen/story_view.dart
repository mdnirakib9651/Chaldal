import 'dart:async';

import 'package:caldal/data/model/response/story_model.dart';
import 'package:caldal/utill/color_resources.dart';
import 'package:caldal/utill/style/lato_styles.dart';
import 'package:flutter/material.dart';

class StoryView extends StatefulWidget {
  StoryModel storyModel;

  StoryView({Key? key, required this.storyModel}) : super(key: key);

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {

  double percent = 0.0;
  late Timer _timer;
  void startTimer(){
    _timer = Timer.periodic(Duration(milliseconds: 3), (timer) {
      setState(() {
        percent += 0.001;
        if(percent > 1){
          _timer.cancel();
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("${widget.storyModel.image}"),
                fit: BoxFit.cover,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 8),
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: percent,
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${widget.storyModel.title}", style: latoBold.copyWith(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: ColorResources.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(child: Icon(Icons.close)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
