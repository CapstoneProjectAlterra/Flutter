import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vaccine_booking/components/constants.dart';
import 'package:vaccine_booking/components/navigator_slide_transition.dart';
import 'package:vaccine_booking/view/history/history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height * 0.20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "Halo,",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey.shade100),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            "Nama User!",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
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
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Ayo lakukan vaksinasi",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque in iaculis leo. Suspendisse elementum tortor ut libero tempus porta.",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        "Berita Terkini",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.68,
                        child: newsListView(),
                      ),
                      const SizedBox(
                        height: 95,
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

  Widget newsListView() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(
        color: Colors.white,
      ),
      scrollDirection: Axis.vertical,
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              NavigatorSlideTransition(
                  child: const HistoryScreen(), direction: AxisDirection.right),
            );
          },
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Judul",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      LineIcon(
                        LineIcons.clock,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        "waktu dipublikasikan",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LineIcon(
                            LineIcons.pencilRuler,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            "nama penulis",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
