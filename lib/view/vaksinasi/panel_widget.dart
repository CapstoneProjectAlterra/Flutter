import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vaccine_booking/components/constants.dart';

import '../../components/navigator_slide_transition.dart';
import 'detail_vaksinasi_screen.dart';

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
            height: 16,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.34,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.53,
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: totalHeight,
            child: listDaftarAnggota(itemCount),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.account_circle),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Tambah Anggota Keluarga",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
                onPressed: () {
                  bottomSheetTambahAnggota();
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  bottomSheetTambahAnggota() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
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
        return GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              NavigatorSlideTransition(
                  child: const DetailVaksinasiScreen(),
                  direction: AxisDirection.right),
            );
          },
          child: Container(
            width: 200,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nama Lengkap",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Text(
                        "NIK :",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "3205415605604560".replaceAll(RegExp(r"."), "*"),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
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
        height: 30,
        width: 30,
        child: SvgPicture.asset('assets/icons/arrow_up.svg'),
      ),
    );
  }

  void togglePanel() => widget.panelController.isPanelOpen
      ? widget.panelController.close()
      : widget.panelController.open();
}
