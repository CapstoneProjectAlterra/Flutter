import 'package:flutter/material.dart';
import 'package:vaccine_booking/components/navigator_fade_transition.dart';
import 'package:vaccine_booking/model/history/history_model.dart';
import 'package:vaccine_booking/view/history/detail_history_screen.dart';

import '../../components/constants.dart';

class HistoryVaccineScreen extends StatelessWidget {
  final HistoryModel history;
  const HistoryVaccineScreen({Key? key, required this.history})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: gradientHorizontal),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              headline(context),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        "Tiket Vaksin",
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.70,
                        child: historyNameList(history),
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

  Widget headline(context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Text(
          "Pesan Vaksinasi",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget historyNameList(HistoryModel history) {
    String dosis = history.booking['schedule']['dose'];
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.white,
          height: 16,
        );
      },
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Center(
          child: Container(
            height: 55,
            decoration: const BoxDecoration(
              color: secondColorLow,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  NavigatorFadeTransition(
                    child: DetailHistoryScreen(history: history),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dosis.replaceAll('DOSIS_', 'Vaksinasi '),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    // ignore: prefer_const_constructors
                    Icon(
                      color: Colors.black,
                      Icons.keyboard_arrow_right,
                      size: 36,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: 1,
    );
  }
}
