import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/constants.dart';

class DetailVaksinasiScreen extends StatefulWidget {
  const DetailVaksinasiScreen({Key? key}) : super(key: key);

  @override
  State<DetailVaksinasiScreen> createState() => _DetailVaksinasiScreenState();
}

class _DetailVaksinasiScreenState extends State<DetailVaksinasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Detail Vaksinasi",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Nama Lengkap",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                        Text(
                          "No. Registrasi :",
                          style: TextStyle(
                              color: Colors.grey.shade800, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 30,
                          child: customDetailVaksinasiRow(
                            title: "Tanggal Lahir",
                            title2: "Jenis Kelamin",
                            colorText: Colors.grey.shade800,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: customDetailVaksinasiRow(
                            fontWeight: FontWeight.bold,
                            title: "YY-MM-DD",
                            title2: "P/L",
                            colorText: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 30,
                          child: customDetailVaksinasiRow(
                            title: "No. NIK",
                            title2: "No. Hp",
                            colorText: Colors.grey.shade800,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: customObscureText(
                              title: "3215468402013154",
                              title2: "0838012850487",
                              colorText: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Lokasi Menerima",
                          style: TextStyle(
                              color: Colors.grey.shade800, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Nama Tempat",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 30,
                child: customDetailVaksinasiRow2(
                    icon: SvgPicture.asset("assets/icon/syringe.svg"),
                    title: "Vaksin A, Dosis Pertama"),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 30,
                child: customDetailVaksinasiRow2(
                    icon: SvgPicture.asset("assets/icon/datetime.svg"),
                    title: "Hari, tanggal, jam sesi"),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Jadwalkan",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customDetailVaksinasiRow(
      {String? title,
      String? title2,
      Color? colorText,
      FontWeight? fontWeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title",
          style:
              TextStyle(color: colorText, fontSize: 18, fontWeight: fontWeight),
        ),
        Text(
          "$title2",
          style:
              TextStyle(color: colorText, fontSize: 18, fontWeight: fontWeight),
        ),
      ],
    );
  }

  Widget customDetailVaksinasiRow2({icon, String? title}) {
    return Row(
      children: [
        SizedBox(height: 30, width: 30, child: icon),
        const SizedBox(
          width: 12,
        ),
        Text(
          "$title",
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 21),
        )
      ],
    );
  }

  Widget customObscureText(
      {String? title,
      String? title2,
      Color? colorText,
      FontWeight? fontWeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!.replaceAll(RegExp(r"."), "*"),
          style:
              TextStyle(color: colorText, fontSize: 18, fontWeight: fontWeight),
        ),
        Text(
          title2!.replaceAll(RegExp(r"."), "*"),
          style:
              TextStyle(color: colorText, fontSize: 18, fontWeight: fontWeight),
        ),
      ],
    );
  }
}
