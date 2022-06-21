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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
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
                      "Tiket Vaksin",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ticketContainer(context),
                    DottedBorder(
                      customPath: (size) {
                        return Path()
                          ..moveTo(20, 0)
                          ..lineTo(size.width - 20, 0);
                      },
                      color: Colors.grey.shade600,
                      dashPattern: const [4, 2],
                      strokeWidth: 2,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: 135,
                        child: containerProgramVaccine(context),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: detailTicket(context),
              ),
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
        Text(
          "$subtitle",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.black),
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
        Text(
          subtitle!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.black),
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
      width: MediaQuery.of(context).size.width * 0.88,
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
              "Berliana Bjorn",
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
                  "000012",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: primaryColor),
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
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(
              "Detail Tiket",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Divider(
            color: Colors.grey.shade500,
            height: 10,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  child: customColumnDetailTicket(
                      title: "Nama Lengkap",
                      subtitle: "Nama Lengkap Pemesan",
                      context: context),
                ),
                SizedBox(
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  child: customColumnDetailTicket2(
                      title: "NIK",
                      subtitle: "3210504864521345",
                      context: context),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  child: customColumnDetailTicket(
                      title: "Tanggal Lahir",
                      subtitle: "YY-MM-DD",
                      context: context),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  child: customColumnDetailTicket(
                      title: "Jenis Kelamin",
                      subtitle: "Perempuan",
                      context: context),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  child: customColumnDetailTicket(
                      title: "No. HP",
                      subtitle: "083905456024",
                      context: context),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  child: customColumnDetailTicket(
                      title: "Alamat",
                      subtitle: "Jl. sentosa",
                      context: context),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 75,
                      child: customColumnDetailTicket(
                          title: "Jenis Vaksin",
                          subtitle: "Astra Zaneca",
                          context: context),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.34,
                    ),
                    SizedBox(
                      height: 75,
                      child: customColumnDetailTicket(
                          title: "Dosis ke", subtitle: "1", context: context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 75,
                      child: customColumnDetailTicket(
                          title: "Tanggal Vaksinasi",
                          subtitle: "Kamis, 16 Juli 2022",
                          context: context),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.21,
                    ),
                    SizedBox(
                      height: 75,
                      child: customColumnDetailTicket(
                          title: "Waktu",
                          subtitle: "08:00-09:00",
                          context: context),
                    ),
                  ],
                ),
                SizedBox(
                  height: 85,
                  child: customColumnDetailTicket(
                      title: "Lokasi Vaksin",
                      subtitle:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      context: context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget containerProgramVaccine(context) {
    return Container(
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
          children: [
            Row(
              children: [
                detaiVaccine(
                    context: context,
                    title: 'Astra Zaneca',
                    assetIcon: 'assets/icons/syringe2.svg'),
                SizedBox(width: MediaQuery.of(context).size.width * 0.19),
                detaiVaccine(
                    context: context,
                    title: 'Dosis 1',
                    assetIcon: 'assets/icons/dose.svg'),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Row(
                  children: [
                    detaiVaccine(
                        context: context,
                        title: 'Kamis, 16 Juli 2022',
                        assetIcon: 'assets/icons/datetime.svg'),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.11),
                Row(
                  children: [
                    detaiVaccine(
                        context: context,
                        title: '08:00 - 09:00',
                        assetIcon: 'assets/icons/clock.svg'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/location.svg',
                  color: primaryColor,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 4,
                ),
                Flexible(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque in iaculis leo.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.grey.shade800),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget detaiVaccine({context, assetIcon, title}) {
    return Row(
      children: [
        SvgPicture.asset(
          assetIcon,
          color: primaryColor,
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.grey.shade800),
        ),
      ],
    );
  }
}
