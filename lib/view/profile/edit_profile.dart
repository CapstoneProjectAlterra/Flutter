import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(gradient: gradientHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.17,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                          'assets/icons/arrow_back.svg',
                          color: Colors.white,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text(
                        "Profile",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.white),
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
                    topRight: Radius.circular(30),
                  ),
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
                      Center(
                        child: SvgPicture.asset(
                          'assets/icons/account.svg',
                          width: 72,
                          height: 72,
                          color: secondColor,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            regularField(
                                controller: _nameEditingController,
                                hintText: 'Nama Lengkap',
                                assetIcon: 'assets/icons/user.svg'),
                            const SizedBox(
                              height: 16,
                            ),
                            numberField(
                                controller: _nameEditingController,
                                hintText: 'Nomor NIK',
                                assetIcon: 'assets/icons/badge.svg',
                                maxLength: 16,
                                validatorLength: 16),
                            const SizedBox(
                              height: 16,
                            ),
                            dateField(
                                controller: _nameEditingController,
                                hintText: 'Tanggal Lahir',
                                assetIcon: 'assets/icons/datetime.svg'),
                            const SizedBox(
                              height: 16,
                            ),
                            regularField(
                                controller: _nameEditingController,
                                hintText: 'Gender',
                                assetIcon: 'assets/icons/gender.svg'),
                            const SizedBox(
                              height: 16,
                            ),
                            emailField(
                                controller: _nameEditingController,
                                hintText: 'Alamat Email',
                                assetIcon: 'assets/icons/envelop.svg'),
                            const SizedBox(
                              height: 16,
                            ),
                            numberField(
                                controller: _nameEditingController,
                                hintText: 'Nomor hp',
                                assetIcon: 'assets/icons/phone.svg',
                                maxLength: 16,
                                validatorLength: 17),
                            const SizedBox(
                              height: 16,
                            ),
                            regularField(
                                controller: _nameEditingController,
                                hintText: 'Status Keluarga',
                                assetIcon: 'assets/icons/status.svg'),
                            const SizedBox(
                              height: 16,
                            ),
                            regularField(
                                controller: _nameEditingController,
                                hintText: 'Alamat Berdasarkan KTP',
                                assetIcon: 'assets/icons/address.svg'),
                            const SizedBox(
                              height: 16,
                            ),
                            regularField(
                                controller: _nameEditingController,
                                hintText: 'Alamat Domisili',
                                assetIcon: 'assets/icons/address.svg'),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Center(
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ElevatedButton(
                            child: const Text(
                              "Simpan",
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
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

  Widget dateField({controller, assetIcon, hintText}) {
    return Row(
      children: [
        SvgPicture.asset(
          assetIcon,
          color: primaryColor,
          height: 32,
          width: 32,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: TextFormField(
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
                contentPadding: const EdgeInsets.only(
                    top: 8, left: 16, bottom: 8, right: 8),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
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
                  borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: buttonColorSecondary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              textInputAction: TextInputAction.next,
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required";
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget numberField(
      {controller, assetIcon, hintText, maxLength, validatorLength}) {
    return Row(
      children: [
        SvgPicture.asset(
          assetIcon,
          color: primaryColor,
          height: 32,
          width: 32,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: TextFormField(
              cursorColor: Colors.white,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
              ],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    top: 8, left: 16, bottom: 8, right: 8),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
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
                  borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: buttonColorSecondary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              textInputAction: TextInputAction.next,
              controller: controller,
              validator: (value) {
                if (value!.length < 10) {
                  return "use valid number";
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget emailField({controller, assetIcon, hintText}) {
    return Row(
      children: [
        SvgPicture.asset(
          assetIcon,
          color: primaryColor,
          height: 32,
          width: 32,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: TextFormField(
              cursorColor: Colors.white,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    top: 8, left: 16, bottom: 8, right: 8),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
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
                  borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: buttonColorSecondary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              textInputAction: TextInputAction.next,
              controller: controller,
              validator: (value) {
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value!)) {
                  return "Use valid email";
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget regularField({controller, assetIcon, hintText}) {
    return Row(
      children: [
        SvgPicture.asset(
          assetIcon,
          color: primaryColor,
          height: 32,
          width: 32,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: TextFormField(
              cursorColor: Colors.white,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    top: 8, left: 16, bottom: 8, right: 8),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
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
                  borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: buttonColorSecondary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              textInputAction: TextInputAction.next,
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required";
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
