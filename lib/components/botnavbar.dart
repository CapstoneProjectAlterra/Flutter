import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vaccine_booking/view/home/home_screen.dart';
import 'package:vaccine_booking/view/vaksinasi/vaksinasi_screen.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({Key? key}) : super(key: key);

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DoubleBack(
        message: "Press back again to exit",
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            height: 70,
            items: const <BottomNavigationBarItem>[
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
              ),
            ],
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
          ),
          tabBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (context) {
                    return const CupertinoPageScaffold(
                      child: HomeScreen(),
                    );
                  },
                );
              case 1:
                return CupertinoTabView(
                  builder: (context) {
                    return const CupertinoPageScaffold(
                        child: VaksinasiScreen());
                  },
                );
              case 2:
                return CupertinoTabView(
                  builder: (context) {
                    return const CupertinoPageScaffold(
                      child: Center(
                        child: Text("History"),
                      ),
                    );
                  },
                );
              default:
                return CupertinoTabView(
                  builder: (context) {
                    return const CupertinoPageScaffold(
                      child: Center(
                        child: Text("Profile"),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
