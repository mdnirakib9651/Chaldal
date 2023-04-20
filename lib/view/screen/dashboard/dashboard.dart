import 'package:caldal/utill/style/lato_styles.dart';
import 'package:caldal/view/screen/categories/categories.dart';
import 'package:caldal/view/screen/drawer/drawer.dart';
import 'package:caldal/view/screen/search/search.dart';
import 'package:flutter/material.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../home/home_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Categories(),
    const Search(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined,),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, ),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorResources.deepPurpleAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
