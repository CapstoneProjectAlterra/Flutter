import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:vaccine_booking/components/navigator_slide_transition.dart';
import 'package:vaccine_booking/view/profile/edit_profile.dart';
import 'package:vaccine_booking/view/welcome/welcome_screen.dart';
import 'package:vaccine_booking/view_model/auth_view_model.dart';

import '../../components/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deleteToken = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(gradient: gradientHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.12,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Profile",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.white),
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
                      Center(
                        child: SvgPicture.asset(
                          'assets/icons/account.svg',
                          width: 96,
                          height: 96,
                          color: secondColor,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      detailProfile(context),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ElevatedButton(
                            child: const Text(
                              "Edit Profile",
                            ),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).push(
                                NavigatorSlideTransition(
                                    child: const EditProfileScreen(),
                                    direction: AxisDirection.right),
                              );
                            },
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/logout.svg',
                            color: primaryColor,
                            height: 28,
                            width: 28,
                          ),
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
      ),
    );
  }

  Widget customProfile({String? icon, String? title, context}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              icon!,
              width: 28,
              height: 28,
              color: primaryColor,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "$title",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
        Divider(
          thickness: 2,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }

  Widget detailProfile(context) {
    return Column(
      children: [
        SizedBox(
          height: 45,
          child: customProfile(
              icon: 'assets/icons/user.svg',
              title: "Nama Lengkap Pemesan",
              context: context),
        ),
        SizedBox(
          height: 45,
          child: customProfile(
              icon: 'assets/icons/badge.svg',
              title: "Nomor NIK",
              context: context),
        ),
        SizedBox(
          height: 45,
          child: customProfile(
              icon: 'assets/icons/datetime.svg',
              title: "Tanggal Lahir",
              context: context),
        ),
        SizedBox(
          height: 45,
          child: customProfile(
              icon: 'assets/icons/gender.svg',
              title: "Gender",
              context: context),
        ),
        SizedBox(
          height: 45,
          child: customProfile(
              icon: 'assets/icons/envelop.svg',
              title: "Alamat Email",
              context: context),
        ),
        SizedBox(
          height: 45,
          child: customProfile(
              icon: 'assets/icons/phone.svg',
              title: "Nomor Hp",
              context: context),
        ),
        SizedBox(
          height: 45,
          child: customProfile(
              icon: 'assets/icons/status.svg',
              title: "Status Keluarga",
              context: context),
        ),
        SizedBox(
          height: 45,
          child: customProfile(
              icon: 'assets/icons/address.svg',
              title: "Alamat Berdasarkan KTP",
              context: context),
        ),
        SizedBox(
          height: 45,
          child: customProfile(
              icon: 'assets/icons/address.svg',
              title: "Alamat Domisili",
              context: context),
        ),
      ],
    );
  }
}
