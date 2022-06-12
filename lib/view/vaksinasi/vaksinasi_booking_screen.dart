import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vaccine_booking/components/constants.dart';
import 'package:vaccine_booking/view/vaksinasi/panel_widget.dart';

class VaksinasiBookingScreen extends StatefulWidget {
  const VaksinasiBookingScreen({Key? key}) : super(key: key);

  @override
  State<VaksinasiBookingScreen> createState() => _VaksinasiBookingScreenState();
}

class _VaksinasiBookingScreenState extends State<VaksinasiBookingScreen> {
  final PanelController panelController = PanelController();
  bool vaksinA = false;
  bool vaksinB = false;
  bool vaksinC = false;
  bool vaksinD = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SlidingUpPanel(
        backdropEnabled: true,
        panelSnapping: true,
        defaultPanelState: PanelState.CLOSED,
        maxHeight: MediaQuery.of(context).size.height * 0.4,
        minHeight: MediaQuery.of(context).size.height * 0.09,
        controller: panelController,
        parallaxEnabled: true,
        parallaxOffset: .5,
        boxShadow: const [
          BoxShadow(
              offset: Offset(0.0, 1.00),
              blurRadius: 17,
              color: Colors.grey,
              spreadRadius: 1.00),
        ],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
        ),
        body: Center(
          child: SingleChildScrollView(
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
                        topRight: Radius.circular(30)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Center(
                          child: Container(
                            height: 180,
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(
                                Icons.add_home,
                                size: 128,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Center(
                          child: Text(
                            "Nama Tempat",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque in iaculis leo. Suspendisse elementum tortor ut libero tempus porta.",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                "Nama Tempat",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: customContainerVaksin(
                                        color: Colors.white,
                                        jenisVaksin: "A",
                                        stock: 200,
                                        tahap: 1,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: customContainerVaksin(
                                        color: Colors.white,
                                        jenisVaksin: "B",
                                        stock: 200,
                                        tahap: 2,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: customContainerVaksin(
                                        color: Colors.white,
                                        jenisVaksin: "C",
                                        stock: 200,
                                        tahap: 1,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: customContainerVaksin(
                                        color: Colors.white,
                                        jenisVaksin: "D",
                                        stock: 200,
                                        tahap: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                "Jadwal Vaksin",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: customContainerJadwal(
                                        color: Colors.white,
                                        jadwal: "08.00 - 09.00",
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: customContainerJadwal(
                                        color: Colors.white,
                                        jadwal: "09.00 - 10.00",
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: customContainerJadwal(
                                        color: Colors.white,
                                        jadwal: "10.00 - 11.00",
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: customContainerJadwal(
                                        color: Colors.white,
                                        jadwal: "11.00 - 12.00",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
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
                                "Pesan Slot Vaksinasi",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
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
      ),
    );
  }

  Widget customContainerJadwal({Color? color, String? jadwal}) {
    return Container(
      width: 125,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LineIcon(
              LineIcons.clock,
              size: 14,
              color: Colors.black,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "$jadwal",
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget customContainerVaksin(
      {Color? color, String? jenisVaksin, int? stock, int? tahap}) {
    return Container(
      width: 125,
      height: 65,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vaksin $jenisVaksin",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Text(
              "$stock dosis tersedia",
              style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
            ),
            Text(
              "Tahap $tahap",
              style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
