import 'package:flutter/material.dart';

import '../view/welcome/welcome_screen.dart';
import 'constants.dart';
import 'navigator_fade_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            defaultPadding,
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      100,
                    ),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "logo",
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Vaccine Booking",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              const Spacer(),
              const Text(
                "versi 1.0",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
