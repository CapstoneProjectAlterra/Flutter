import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vaccine_booking/components/constants.dart';

import '../../../model/profile/family_model.dart';
import '../edit_family_screen.dart';
import '../../../view_model/profile_view_model.dart';
import '../../../view_model/vaksinasi_view_model.dart';
import '../../../components/navigator_fade_transition.dart';

class ContentListBooking extends StatefulWidget {
  final VaksinasiViewModel vaksinasi;
  final ProfileViewModel user;
  final int index;
  final bool isPressed;
  final FamilyModel family;
  const ContentListBooking(
      {Key? key,
      required this.isPressed,
      required this.user,
      required this.vaksinasi,
      required this.index,
      required this.family})
      : super(key: key);

  @override
  State<ContentListBooking> createState() => _ContentListBookingState();
}

class _ContentListBookingState extends State<ContentListBooking> {
  bool? isPressed;
  @override
  void initState() {
    isPressed = widget.isPressed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: isPressed! ? Colors.blueAccent : Colors.white,
      child: InkWell(
        onTap: () {
          setState(
            () {
              isPressed = !isPressed!;
              if (isPressed == true) {
                widget.vaksinasi.addSelectBookingVaksinasi(widget.family);
              } else {
                widget.vaksinasi.deleteSelectBookingVaksinasi(widget.family);
              }
            },
          );
        },
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            color: secondColorLow,
            border: isPressed!
                ? Border.all(color: pressedColor, width: 3)
                : Border.all(color: secondColorLow, width: 0),
            borderRadius: const BorderRadius.all(
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
                    Row(
                      children: [
                        Text(
                          widget.vaksinasi.dataPersonVaksinasiList[widget.index]
                              .name!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.vaksinasi.dataPersonVaksinasiList[widget.index]
                                      .name ==
                                  widget.user.name
                              ? "Saya"
                              : widget
                                  .vaksinasi
                                  .dataPersonVaksinasiList[widget.index]
                                  .statusFamily!
                                  .toLowerCase()
                                  .replaceFirst(
                                    widget
                                        .vaksinasi
                                        .dataPersonVaksinasiList[widget.index]
                                        .statusFamily!
                                        .toLowerCase()[0],
                                    widget
                                        .vaksinasi
                                        .dataPersonVaksinasiList[widget.index]
                                        .statusFamily!
                                        .toUpperCase()[0],
                                  ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.grey.shade700),
                        ),
                      ],
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
                          widget.vaksinasi.dataPersonVaksinasiList[widget.index]
                              .nik!,
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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        NavigatorFadeTransition(
                          child: EditFamilyScreen(
                            family: widget.vaksinasi
                                .dataPersonVaksinasiList[widget.index],
                          ),
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/edit.svg',
                        color: Colors.black,
                        width: 25,
                        height: 25,
                      ),
                    ),
                    widget.vaksinasi.dataPersonVaksinasiList[widget.index]
                                .name ==
                            widget.user.name
                        ? IconButton(
                            onPressed: () async {
                              Fluttertoast.showToast(
                                  msg:
                                      'Hanya Bisa Menghapus Anggota Keluargamu Saja');
                            },
                            icon: SvgPicture.asset(
                              'assets/icons/delete.svg',
                              color: Colors.black,
                              width: 25,
                              height: 25,
                            ),
                          )
                        : IconButton(
                            onPressed: () async {
                              await Future.delayed(const Duration(seconds: 1))
                                  .then(
                                    (_) async => await widget.vaksinasi
                                        .deleteFamily(
                                            id: widget
                                                .vaksinasi
                                                .dataPersonVaksinasiList[
                                                    widget.index]
                                                .id,
                                            index: widget.index),
                                  )
                                  .then(
                                    (_) => Fluttertoast.showToast(
                                        toastLength: Toast.LENGTH_SHORT,
                                        msg: "Family Member Berhasil Dihapus"),
                                  );
                            },
                            icon: SvgPicture.asset(
                              'assets/icons/delete.svg',
                              color: Colors.black,
                              width: 25,
                              height: 25,
                            ),
                          )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
