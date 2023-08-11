import 'package:flutter/material.dart';

import '../screen/start_screen.dart';
import 'categories_text.dart';
import 'category_text_widget.dart';

const List<Widget> _screens = <Widget> [
  StartScreen(),
  Placeholder(),
  Placeholder(),
  Placeholder()
];

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: _bucket,
        child: _screens[currentPageIndex],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          if (currentPageIndex == index) return;
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            label: 'Menu',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
            label: 'Person',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outlined,
              color: Colors.white,
            ),
            label: 'Person',
          ),
        ],
        animationDuration: const Duration(milliseconds: 1000),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: const Color(0xFF010035),
        indicatorColor: const Color(0xFF010035),
      ),
    );
  }
}
