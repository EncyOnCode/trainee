import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../home_store/presentation/ui/screen/start_screen.dart';

@RoutePage()
class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentPageIndex = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  static const List<Widget> _screens = <Widget>[
    StartScreen(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

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
