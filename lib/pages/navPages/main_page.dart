import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mountain_trips/pages/navPages/bar_item.dart';
import 'package:mountain_trips/pages/home_page.dart';
import 'package:mountain_trips/pages/navPages/my_page.dart';
import 'package:mountain_trips/pages/navPages/search_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages = const [
    HomePage(),
    BarItem(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;
  void onTap(int index){
setState(() {
  currentIndex = index;
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting, <= the default one
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home' ),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp), label: 'Bar' ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search' ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My' ),
        ],
      ),
    );
  }
}
