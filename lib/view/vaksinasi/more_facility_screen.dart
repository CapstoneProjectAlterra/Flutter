import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vaccine_booking/components/constants.dart';
import 'package:vaccine_booking/components/navigator_fade_transition.dart';
import 'package:vaccine_booking/view/vaksinasi/vaksinasi_booking_screen.dart';

import '../../view_model/vaksinasi_view_model.dart';

class MoreFacilityScreen extends StatefulWidget {
  final String? query;
  const MoreFacilityScreen({Key? key, required this.query}) : super(key: key);

  @override
  State<MoreFacilityScreen> createState() => _MoreFacilityScreenState();
}

class _MoreFacilityScreenState extends State<MoreFacilityScreen> {
  String moreQuery = '';
  bool isExpand = false;
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final healthFacilities = Provider.of<VaksinasiViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 35,
          title: isExpand
              ? Row(
                  children: [
                    Expanded(
                      child: searchTextField(healthFacilities),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              setState(
                                () {
                                  searchController.clear();
                                },
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: SvgPicture.asset(
                              'assets/icons/arrow_back.svg',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Fasilitas Kesehatan",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, right: 12),
                      child: Material(
                        color: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                isExpand = true;
                              },
                            );
                          },
                          icon: const Icon(
                            CupertinoIcons.search,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: defaultPadding, top: defaultPadding, right: defaultPadding),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              location(context),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height,
                child: listFacility(healthFacilities),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listFacility(VaksinasiViewModel healthFacilities) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.8,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: widget.query!.isEmpty
                            ? NetworkImage(
                                healthFacilities.facilityList[index].imgUrl!)
                            : moreQuery.isEmpty
                                ? NetworkImage(
                                    healthFacilities.result[index].imgUrl!)
                                : NetworkImage(
                                    healthFacilities.moreResult[index].imgUrl!),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.33,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.query!.isEmpty
                                ? Text(
                                    healthFacilities
                                        .facilityList[index].facilityName!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(color: Colors.black),
                                  )
                                : moreQuery.isEmpty
                                    ? Text(
                                        healthFacilities
                                            .result[index].facilityName!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(color: Colors.black),
                                      )
                                    : Text(
                                        healthFacilities
                                            .moreResult[index].facilityName!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(color: Colors.black),
                                      ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/reserve.svg',
                                    width: 16, height: 16, color: primaryColor),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Kuota Tersedia",
                                  style: Theme.of(context).textTheme.bodyText2,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.20,
                        bottom: 0,
                        right: 0,
                        child: buttonText(
                            context,
                            widget.query!.isEmpty
                                ? healthFacilities.facilityList[index]
                                : moreQuery.isEmpty
                                    ? healthFacilities.result[index]
                                    : healthFacilities.moreResult[index]),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: widget.query!.isEmpty
            ? healthFacilities.facilityList.length
            : moreQuery.isEmpty
                ? healthFacilities.result.length
                : healthFacilities.moreResult.length);
  }

  Widget buttonText(context, facilities) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              NavigatorFadeTransition(
                child: VaksinasiBookingScreen(
                  facilities: facilities,
                ),
              ),
            );
          },
          child: Text(
            'Selengkapnya',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: primaryColor),
          ),
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          color: primaryColor,
          size: 14,
        ),
      ],
    );
  }

  Widget location(context) {
    return Padding(
      padding: const EdgeInsets.only(left: defaultPadding),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/location.svg',
            width: 20,
            height: 20,
            color: primaryColor,
          ),
          const SizedBox(
            width: 8,
          ),
          widget.query!.isEmpty
              ? Text(
                  'All health of facility',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.black),
                )
              : moreQuery.isEmpty
                  ? Text(
                      widget.query!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.black),
                    )
                  : Text(
                      moreQuery,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.black),
                    ),
        ],
      ),
    );
  }

  Widget searchTextField(VaksinasiViewModel healthFacilities) {
    return TextField(
      onSubmitted: (value) => setState(
        () {
          moreQuery = value;
          healthFacilities.searchMoreFacility(query: moreQuery);
        },
      ),
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Colors.grey.shade800),
      controller: searchController,
      decoration: InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: IconButton(
              onPressed: () {
                setState(
                  () {
                    isExpand = false;
                    searchController.clear();
                  },
                );
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.grey,
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 8),
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.grey.shade400),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'search'),
    );
  }
}
