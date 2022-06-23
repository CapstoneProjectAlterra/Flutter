import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine_booking/components/constants.dart';
import 'package:vaccine_booking/view/splash/splash_screen.dart';
import 'package:vaccine_booking/view/home/home_screen.dart';
import 'package:vaccine_booking/view_model/auth_view_model.dart';
import 'package:vaccine_booking/view_model/home_view_model.dart';

import 'view_model/vaksinasi_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => VaksinasiViewModel(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/home': (context) => const HomeScreen(),
        },
        theme: ThemeData(
          appBarTheme: appBarTheme,
          textTheme: textTheme,
          elevatedButtonTheme: elevatedButtonTheme,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
