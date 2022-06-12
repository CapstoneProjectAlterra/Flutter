import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:vaccine_booking/components/navigator_fade_transition.dart';
import 'package:vaccine_booking/components/navigator_slide_transition.dart';
import 'package:vaccine_booking/view/splash/splash_screen.dart';
import 'package:vaccine_booking/view/welcome/welcome_screen.dart';
import 'package:vaccine_booking/view_model/auth_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final deleteToken = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.08,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Pesan Vaksinasi",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    const Center(
                      child: Icon(
                        Icons.account_circle,
                        size: 96,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Nama Lengkap Pemesan",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Nomor NIK",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Tanggal Lahir",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Gender",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Alamat Email",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Nomor Hp",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Status Keluarga",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Alamat Berdasarkan KTP",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Alamat Domisili",
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(
                              NavigatorFadeTransition(
                                child: const SplashScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.logout),
                        TextButton(
                          onPressed: () {
                            deleteToken.deleteToken();
                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(
                              NavigatorSlideTransition(
                                  child: const WelcomeScreen(),
                                  direction: AxisDirection.right),
                            );
                            Fluttertoast.showToast(msg: "Berhasil Keluar");
                          },
                          child: Text(
                            "keluar akun",
                            style: Theme.of(context).textTheme.subtitle1!,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customProfile({Icon? icon, String? title}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            icon!,
            const SizedBox(
              width: 16,
            ),
            Text(
              "$title",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.grey.shade700,
        ),
      ],
    );
  }
}
