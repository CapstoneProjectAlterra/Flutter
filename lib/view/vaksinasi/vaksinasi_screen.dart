import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vaccine_booking/components/constants.dart';
import 'package:vaccine_booking/components/navigator_slide_transition.dart';
import 'package:vaccine_booking/view/vaksinasi/more_facility_screen.dart';
import 'package:vaccine_booking/view/vaksinasi/vaksinasi_booking_screen.dart';

class VaksinasiScreen extends StatefulWidget {
  final String? image;
  const VaksinasiScreen({Key? key, this.image}) : super(key: key);

  @override
  State<VaksinasiScreen> createState() => _VaksinasiScreenState();
}

class _VaksinasiScreenState extends State<VaksinasiScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: gradientHorizontal),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        "Pesan Vaksinasi",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              "Pilih lokasi vaksinasi terdekat",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            SizedBox(
                              height: 50,
                              child: searchTextField(),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Fasilitas kesehatan terdekat",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 25,
                                  width: 100,
                                  child: moreButton(
                                      'https://i.postimg.cc/RFM34wYb/a.png'),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: listNearFacility(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget moreButton(image) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).push(
          NavigatorSlideTransition(
              child: MoreFacilityScreen(
                image: image,
              ),
              direction: AxisDirection.right),
        );
      },
      child: const Text(
        "Lihat Semua",
      ),
    );
  }

  Widget searchTextField() {
    return TextField(
      focusNode: FocusNode(canRequestFocus: false),
      autofocus: false,
      controller: searchController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: buttonColorSecondary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: buttonColorSecondary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: 'Cari kota, provinsi, kode pos',
        suffixIcon: SizedBox(
          height: 55,
          width: 65,
          child: ElevatedButton(
            onPressed: () {},
            child: const Icon(CupertinoIcons.search),
          ),
        ),
      ),
    );
  }

  Widget listNearFacility() {
    return Padding(
      padding: const EdgeInsets.only(left: 36, right: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            NavigatorSlideTransition(
                                child: const VaksinasiBookingScreen(),
                                direction: AxisDirection.right),
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.23,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://i.postimg.cc/RFM34wYb/a.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "RS AMC",
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                              color: primaryColor,
                              height: 20,
                              width: 20,
                              "assets/icons/document_search.svg"),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Kuota Tersedia",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
