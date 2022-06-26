import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vaccine_booking/components/constants.dart';
import 'package:vaccine_booking/view/vaksinasi/widget/panel_widget.dart';

import '../../components/skeleton_container.dart';
import '../../model/vaksinasi/health_facility_model.dart';

class VaksinasiBookingScreen extends StatefulWidget {
  final HealthFacilityModel facilities;
  const VaksinasiBookingScreen({Key? key, required this.facilities})
      : super(key: key);

  @override
  State<VaksinasiBookingScreen> createState() => _VaksinasiBookingScreenState();
}

class _VaksinasiBookingScreenState extends State<VaksinasiBookingScreen> {
  final TextEditingController dateCtl = TextEditingController();
  final PanelController panelController = PanelController();
  String tempString = '';
  bool vaksinA = false;
  bool vaksinB = false;
  bool vaksinC = false;
  bool vaksinD = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        defaultPanelState: PanelState.CLOSED,
        maxHeight: MediaQuery.of(context).size.height * 0.58,
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
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        "Pesan Vaksinasi",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 1.09,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          imageFacility(),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            widget.facilities.facilityName!,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/location.svg',
                                color: Colors.grey.shade700,
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Text(
                                  widget.facilities.streetName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: Colors.grey.shade900),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Jadwal",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.grey.shade700),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          selectDate(),
                          const SizedBox(
                            height: 16,
                          ),
                          selectVaccine(),
                          const SizedBox(
                            height: 16,
                          ),
                          Center(
                            child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: tempString.isEmpty
                                  ? const ElevatedButton(
                                      onPressed: null,
                                      child: Text(
                                        "Pesan",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : ElevatedButton(
                                      child: const Text(
                                        "Pesan",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        if (tempString.isNotEmpty ||
                                            vaksinA != true ||
                                            vaksinB != true ||
                                            vaksinC != true ||
                                            vaksinD != true) {
                                          panelController.open();
                                        }
                                      },
                                    ),
                            ),
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
      ),
    );
  }

  Widget customContainerVaksin(
      {Color? border,
      Color? color,
      String? jenisVaksin,
      int? stock,
      int? tahap,
      String? time,
      double? widthBorder}) {
    return Container(
      width: dateCtl.text.isNotEmpty
          ? MediaQuery.of(context).size.width * 0.43
          : 0,
      height: dateCtl.text.isNotEmpty ? 100 : 0,
      decoration: BoxDecoration(
        border: Border.all(
          color: border!,
          width: widthBorder!,
        ),
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/clock.svg',
                    color: primaryColor,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    time!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.shade700,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/syringe2.svg',
                        color: primaryColor,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        jenisVaksin!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/dose.svg',
                        color: primaryColor,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Dosis $tahap',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.grey.shade800),
                      ),
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
                    'assets/icons/product.svg',
                    color: primaryColor,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '$stock Dosis',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.grey.shade800),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageFacility() {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.17,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            errorWidget: (context, url, error) {
              return Image.asset(
                'assets/images/default_facility.png',
                fit: BoxFit.cover,
              );
            },
            placeholder: (context, url) {
              return imageSkeleton();
            },
            imageUrl: widget.facilities.imgUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget selectVaccine() {
    return Row(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    if (vaksinA == false ||
                        vaksinB == true ||
                        vaksinC == true ||
                        vaksinD == true) {
                      tempString = 'a';
                      vaksinA = true;
                      vaksinB = false;
                      vaksinC = false;
                      vaksinD = false;
                    }
                  },
                );
              },
              child: vaksinA
                  ? customContainerVaksin(
                      color: secondColorLow,
                      border: primaryColor,
                      jenisVaksin: "Sinovac",
                      time: "09.00 - 10.00",
                      stock: 100,
                      tahap: 1,
                      widthBorder: 3)
                  : customContainerVaksin(
                      border: pressedColor,
                      color: Colors.white,
                      jenisVaksin: "Sinovac",
                      time: "09.00 - 10.00",
                      stock: 100,
                      tahap: 1,
                      widthBorder: 1),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    if (vaksinB == false ||
                        vaksinA == true ||
                        vaksinC == true ||
                        vaksinD == true) {
                      tempString = 'a';
                      vaksinB = true;
                      vaksinA = false;
                      vaksinC = false;
                      vaksinD = false;
                    }
                  },
                );
              },
              child: vaksinB
                  ? customContainerVaksin(
                      color: secondColorLow,
                      border: primaryColor,
                      jenisVaksin: "Sinovac",
                      time: "09.00 - 10.00",
                      stock: 100,
                      tahap: 1,
                      widthBorder: 3)
                  : customContainerVaksin(
                      border: pressedColor,
                      color: Colors.white,
                      jenisVaksin: "Sinovac",
                      time: "09.00 - 10.00",
                      stock: 100,
                      tahap: 1,
                      widthBorder: 1),
            ),
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    if (vaksinC == false ||
                        vaksinA == true ||
                        vaksinB == true ||
                        vaksinD == true) {
                      tempString = 'a';
                      vaksinC = true;
                      vaksinA = false;
                      vaksinB = false;
                      vaksinD = false;
                    }
                  },
                );
              },
              child: vaksinC
                  ? customContainerVaksin(
                      color: secondColorLow,
                      border: primaryColor,
                      jenisVaksin: "Sinovac",
                      time: "09.00 - 10.00",
                      stock: 100,
                      tahap: 1,
                      widthBorder: 3)
                  : customContainerVaksin(
                      border: pressedColor,
                      color: Colors.white,
                      jenisVaksin: "Sinovac",
                      time: "09.00 - 10.00",
                      stock: 100,
                      tahap: 1,
                      widthBorder: 1),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    if (vaksinD == false ||
                        vaksinA == true ||
                        vaksinB == true ||
                        vaksinC == true) {
                      tempString = 'a';
                      vaksinD = true;
                      vaksinA = false;
                      vaksinB = false;
                      vaksinC = false;
                    }
                  },
                );
              },
              child: vaksinD
                  ? customContainerVaksin(
                      color: secondColorLow,
                      border: primaryColor,
                      jenisVaksin: "Sinovac",
                      time: "09.00 - 10.00",
                      stock: 100,
                      tahap: 1,
                      widthBorder: 3)
                  : customContainerVaksin(
                      border: pressedColor,
                      color: Colors.white,
                      jenisVaksin: "Sinovac",
                      time: "09.00 - 10.00",
                      stock: 100,
                      tahap: 1,
                      widthBorder: 1),
            ),
          ],
        ),
      ],
    );
  }

  Widget selectDate() {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2023));

        if (pickedDate != null) {
          setState(
            () {
              dateCtl.text = DateFormat('dd-MM-yyyy').format(pickedDate);
            },
          );
        }
      },
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: Colors.grey.shade700),
        controller: dateCtl,
        enabled: false,
        cursorColor: Colors.white,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          suffixIconConstraints:
              const BoxConstraints(minHeight: 24, minWidth: 24),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SvgPicture.asset(
              'assets/icons/suffix.svg',
              color: Colors.grey,
              height: 24,
              width: 24,
            ),
          ),
          contentPadding:
              const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
          hintText: 'Pilih tanggal',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.grey.shade400),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: buttonColorSecondary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: buttonColorSecondary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value!.isEmpty) {
            return "Required";
          }
          return null;
        },
      ),
    );
  }

  Widget imageSkeleton() {
    return SkeletonContainer(
      borderRadius: 10,
      height: MediaQuery.of(context).size.height * 0.17,
      width: MediaQuery.of(context).size.width * 0.9,
    );
  }
}
