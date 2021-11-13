

import 'package:flutter/material.dart';
import 'package:tudotask/constants/constant.dart';

import 'google_maps.dart';
import 'home.dart';

class BottomPage extends StatefulWidget {
  @override
  _BottomPageState createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int selectedIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [Dashboard(), MapPage()];


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.blur_circular),
            label: 'Google Map',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 50), curve: Curves.easeInOut);
  }

  void onPageChanged(int page) {
    setState(() {
      selectedIndex = page;
    });
  }
}

