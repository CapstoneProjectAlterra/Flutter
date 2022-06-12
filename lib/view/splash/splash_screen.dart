import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaccine_booking/components/botnavbar.dart';

import '../welcome/welcome_screen.dart';
import '../../components/constants.dart';
import '../../components/navigator_fade_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        prefs.getString('tokenId') != null
            ? Navigator.of(context).pushReplacement(
                NavigatorFadeTransition(
                  child: const BotNavBar(),
                ),
              )
            : Navigator.of(context).pushReplacement(
                NavigatorFadeTransition(
                  child: const WelcomeScreen(),
                ),
              );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: gradientVertical),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(
              defaultPadding,
            ),
            child: Center(
              child: Text(
                "GetVaccine",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.white, fontSize: 32),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
