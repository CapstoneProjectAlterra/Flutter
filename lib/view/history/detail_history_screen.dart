import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vaccine_booking/components/constants.dart';

class DetailHistoryScreen extends StatelessWidget {
  const DetailHistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.472,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          backIcon(context),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Nama Pemesan",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ticketContainer(context),
                        ],
                      ),
                      Positioned(
                        bottom: 30,
                        child: DottedBorder(
                          customPath: (size) {
                            return Path()
                              ..moveTo(20, 0)
                              ..lineTo(size.width - 20, 0);
                          },
                          color: tertiary,
                          dashPattern: const [8, 5],
                          strokeWidth: 1,
                          child: containerProgramVaccine(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              detailTicket(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget customColumnDetailTicket({String? title, String? subtitle, context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.grey.shade600),
        ),
        const SizedBox(
          height: 8,
        ),
        Text("$subtitle",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.black)),
        Divider(
          color: Colors.grey.shade400,
        ),
      ],
    );
  }

  Widget customColumnDetailTicket2({String? title, String? subtitle, context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.grey.shade600),
        ),
        const SizedBox(
          height: 8,
        ),
        Text("$subtitle".replaceAll(RegExp(r"."), "*"),
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.black)),
        Divider(
          color: Colors.grey.shade400,
        ),
      ],
    );
  }

  Widget backIcon(context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: SvgPicture.asset(
        'assets/icons/arrow_back.svg',
        color: Colors.white,
        width: 36,
        height: 36,
      ),
    );
  }

  Widget ticketContainer(context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Vaksin Pertama",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.black),
            ),
            Row(
              children: [
                Text(
                  "No. Antrian :",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "1234567",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget detailTicket(context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
            Text("Detail Tiket",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.black)),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              height: 90,
              child: customColumnDetailTicket(
                  title: "Nama Lengkap",
                  subtitle: "Nama Lengkap Pemesan",
                  context: context),
            ),
            SizedBox(
              height: 90,
              child: customColumnDetailTicket2(
                  title: "NIK", subtitle: "3210504864521345", context: context),
            ),
            SizedBox(
              height: 90,
              child: customColumnDetailTicket(
                  title: "Tanggal Lahir",
                  subtitle: "YY-MM-DD",
                  context: context),
            ),
            SizedBox(
              height: 90,
              child: customColumnDetailTicket(
                  title: "Jenis Kelamin",
                  subtitle: "Perempuan",
                  context: context),
            ),
            SizedBox(
              height: 90,
              child: customColumnDetailTicket(
                  title: "No. HP", subtitle: "083905456024", context: context),
            ),
            SizedBox(
              height: 90,
              child: customColumnDetailTicket(
                  title: "Alamat", subtitle: "Jl. sentosa", context: context),
            ),
            SizedBox(
              height: 90,
              child: customColumnDetailTicket(
                  title: "Jenis Vaksin",
                  subtitle: "Vaksin A",
                  context: context),
            ),
          ],
        ),
      ),
    );
  }

  Widget containerProgramVaccine(context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.84,
      height: 160,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Program Vaksinasi",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.grey.shade600),
            ),
            Text(
              "Vaksin Program Pemerintah",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black),
            ),
            Text(
              "Lokasi dan Jadwal Vaksinasi",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.grey.shade600),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque in iaculis leo.",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
