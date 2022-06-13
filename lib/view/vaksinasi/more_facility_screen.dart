import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vaccine_booking/components/constants.dart';

class MoreFacilityScreen extends StatelessWidget {
  const MoreFacilityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 35,
          title: Row(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                      height: 35,
                      width: 35,
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
              const Spacer(),
              Material(
                color: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.search,
                    size: 32,
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
              location(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget location(context) {
    return Padding(
      padding: const EdgeInsets.only(left: defaultPadding),
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            color: primaryColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "Bandung",
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      ),
    );
  }
}
