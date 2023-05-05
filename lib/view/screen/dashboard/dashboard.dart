
import 'package:caldal/view/screen/categories/categories.dart';
import 'package:caldal/view/screen/search/search.dart';
import 'package:flutter/material.dart';
import '../../../utill/color_resources.dart';
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
