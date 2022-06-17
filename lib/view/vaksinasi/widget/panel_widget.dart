import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vaccine_booking/components/constants.dart';
import 'package:vaccine_booking/components/navigator_slide_transition.dart';
import 'package:vaccine_booking/view/vaksinasi/register_family_screen.dart';

class PanelWidget extends StatefulWidget {
  final PanelController panelController;
  final ScrollController controller;
  const PanelWidget(
      {Key? key, required this.controller, required this.panelController})
      : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  bool isBool = false;
  @override
  Widget build(BuildContext context) {
    int itemCount = 2;
    int heightTotal = itemCount * 100;
    double totalHeight = heightTotal.toDouble();
    return SingleChildScrollView(
      controller: widget.controller,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.38,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.49,
                child: const Text(
                  "Pilih Anggota",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.10,
                child: dragHandle(),
              ),
            ],
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: totalHeight,
              child: listDaftarAnggota(itemCount),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: secondStateButton,
                child: const Text(
                  "Tambah Anggota Keluarga",
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    NavigatorSlideTransition(
                        child: const RegisterFamilyScreen(),
                        direction: AxisDirection.right),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                child: Text(
                  "Pesan",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget listDaftarAnggota(itemCount) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.white,
        );
      },
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Container(
          width: 200,
          height: 80,
          decoration: const BoxDecoration(
            color: secondColorLow,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Lengkap",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "NIK :",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.grey.shade900),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "3205415605604560".replaceAll(RegExp(r"."), "*"),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.grey.shade900),
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Material(
                  color: secondColorLow,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget dragHandle() {
    return TextButton(
      onPressed: togglePanel,
      child: SizedBox(
        height: 25,
        width: 25,
        child: SvgPicture.asset(
          'assets/icons/arrow_up.svg',
          color: primaryColor,
        ),
      ),
    );
  }

  void togglePanel() => widget.panelController.isPanelOpen
      ? widget.panelController.close()
      : widget.panelController.open();
}
