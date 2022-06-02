import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'tab_navigator.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({Key? key}) : super(key: key);

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  String _currentPage = "Screen1";
  List<String> pageKeys = ["Screen1", "Screen2", "Screen3", "Screen4"];
  int _selectedIndex = 0;
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Screen1": GlobalKey<NavigatorState>(),
    "Screen2": GlobalKey<NavigatorState>(),
    "Screen3": GlobalKey<NavigatorState>(),
    "Screen4": GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index) {
    setState(() {
      _currentPage = pageKeys[index];
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _buildOffstageNavigator("Screen1"),
            _buildOffstageNavigator("Screen2"),
            _buildOffstageNavigator("Screen3"),
            _buildOffstageNavigator("Screen4"),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 1.00),
                      blurRadius: 15,
                      color: Colors.grey,
                      spreadRadius: 1.00),
                ],
              ),
              height: 80,
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0)),
                child: BottomNavigationBar(
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 50),
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                  onTap: (int index) {
                    _selectTab(pageKeys[index], index);
                  },
                  currentIndex: _selectedIndex,
                  items: const [
                    BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.grey,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(
                        LineIcons.syringe,
                        color: Colors.black,
                      ),
                      icon: Icon(
                        LineIcons.syringe,
                        color: Colors.grey,
                      ),
                      label: 'Vaksinasi',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.receipt_long,
                        color: Colors.black,
                      ),
                      icon: Icon(
                        Icons.receipt_long_outlined,
                        color: Colors.grey,
                      ),
                      label: 'History',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                      icon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.grey,
                      ),
                      label: 'Profile',
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
