import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:vaccine_booking/components/constants.dart';

class DetailHistoryScreen extends StatefulWidget {
  const DetailHistoryScreen({Key? key}) : super(key: key);

  @override
  State<DetailHistoryScreen> createState() => _DetailHistoryScreenState();
}

class _DetailHistoryScreenState extends State<DetailHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
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
              height: MediaQuery.of(context).size.height * 0.50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pesan Vaksinasi",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Vaksin Pertama",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "No. Tiket :",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "1234567".replaceAll(RegExp(r"."), "*"),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 31,
                      child: DottedBorder(
                        customPath: (size) {
                          return Path()
                            ..moveTo(20, 0)
                            ..lineTo(size.width - 20, 0)
                            ..arcToPoint(
                              Offset(size.width, 20),
                              radius: const Radius.circular(20),
                            )
                            ..lineTo(size.width, size.height - 20)
                            ..arcToPoint(
                              Offset(size.width - 20, size.height),
                              radius: const Radius.circular(20),
                            )
                            ..lineTo(20, size.height)
                            ..arcToPoint(
                              Offset(0, size.height - 20),
                              radius: const Radius.circular(20),
                            )
                            ..lineTo(0, 20)
                            ..arcToPoint(
                              const Offset(20, 0),
                              radius: const Radius.circular(20),
                            );
                        },
                        color: Colors.black,
                        dashPattern: const [8, 5],
                        strokeWidth: 2,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.84,
                          height: 250,
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
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 18),
                                ),
                                const Text(
                                  "Vaksin Program Pemerintah",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Lokasi dan Jadwal Vaksinasi",
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 18),
                                ),
                                const Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque in iaculis leo.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
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
                    const Text(
                      "Detail Tiket",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      height: 80,
                      child: customColumnDetailTicket(
                          title: "Nama Lengkap",
                          subtitle: "Nama Lengkap Pemesan"),
                    ),
                    SizedBox(
                      height: 80,
                      child: customColumnDetailTicket2(
                          title: "NIK", subtitle: "3210504864521345"),
                    ),
                    SizedBox(
                      height: 80,
                      child: customColumnDetailTicket(
                          title: "Tanggal Lahir", subtitle: "YY-MM-DD"),
                    ),
                    SizedBox(
                      height: 80,
                      child: customColumnDetailTicket(
                          title: "No. HP", subtitle: "083805456024"),
                    ),
                    SizedBox(
                      height: 80,
                      child: customColumnDetailTicket(
                          title: "Alamat", subtitle: "Jl. sentosa"),
                    ),
                    SizedBox(
                      height: 80,
                      child: customColumnDetailTicket(
                          title: "Jenis Vaksin", subtitle: "Vaksin A"),
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

  Widget customColumnDetailTicket({String? title, String? subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TextStyle(color: Colors.grey.shade800, fontSize: 18),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "$subtitle",
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }

  Widget customColumnDetailTicket2({String? title, String? subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TextStyle(color: Colors.grey.shade800, fontSize: 18),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "$subtitle".replaceAll(RegExp(r"."), "*"),
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
