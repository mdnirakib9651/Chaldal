
import 'package:caldal/utill/style/lato_styles.dart';
import 'package:flutter/material.dart';

class ListViewDrawerButton extends StatefulWidget {
  IconData icon;
  String title;
  String isOnClick;
  // Function onTab;
  ListViewDrawerButton({Key? key,
    required this.title,
    required this.icon,
    required this.isOnClick,
    // required this.onTab
  }) : super(key: key);

  @override
  State<ListViewDrawerButton> createState() => _ListViewDrawerButtonState();
}

class _ListViewDrawerButtonState extends State<ListViewDrawerButton> {
  @override
  Widget build(BuildContext context) {

    String isClick = "Rakib";

    return InkWell(
      onTap: (){
        // widget.onTab;
        isClick = widget.title;
        setState(() {

        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // color: Colors.grey,
            border: isClick == widget.title ? Border.all() : Border.all(width: 1, color: Colors.grey.withOpacity(.3))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(widget.icon, color: Colors.amberAccent, size: 30,),
                  Text(widget.title, style: latoBold.copyWith(fontSize: 17, color: Colors.black),)
                ],
              ),
              const Icon(Icons.navigate_next, color: Colors.grey,)
            ],
          ),
        ),
      ),
    );
  }
}
