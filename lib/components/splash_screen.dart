// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:vaccine_booking/component/constans.dart';
// import 'package:vaccine_booking/component/navigator_fade_transition.dart';
// import 'package:vaccine_booking/view/welcome/welcome_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   startTime() async {
//     await Future.delayed(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//           NavigatorFadeTransition(child: const WelcomeScreen()));
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     startTime();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Color(0xff0072FF), Color(0xff68F3F8)])),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(defaultPadding),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                     width: 70,
//                     height: 70,
//                     child: Image.asset("assets/images/logo.png")),
//                 Text("Vaccine Booking",
//                     style: GoogleFonts.fjallaOne(
//                         color: Colors.white, fontSize: 22)),
//                 const SizedBox(height: 22)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
