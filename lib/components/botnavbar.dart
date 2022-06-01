import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vaccine_booking/view/history/history_screen.dart';
import 'package:vaccine_booking/view/home/home_screen.dart';
import 'package:vaccine_booking/view/profile/profile_screen.dart';
import 'package:vaccine_booking/view/vaksinasi/vaksinasi_screen.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({Key? key}) : super(key: key);

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> fourthTabNavKey = GlobalKey<NavigatorState>();

  late CupertinoTabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = CupertinoTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final listOfKeys = [
      firstTabNavKey,
      secondTabNavKey,
      thirdTabNavKey,
      fourthTabNavKey
    ];
    List listScreen = [
      const HomeScreen(),
      const VaksinasiScreen(),
      const HistoryScreen(),
      const ProfileScreen()
    ];
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return !await listOfKeys[tabController.index]
              .currentState!
              .maybePop();
        },
        child: CupertinoTabScaffold(
            controller: tabController,
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
              return DoubleBack(
                message: "Press back again to exit",
                child: CupertinoTabView(
                  navigatorKey: listOfKeys[index],
                  builder: (context) {
                    return listScreen[index];
                  },
                ),
              );
            }),
      ),
    );
  }
}
