import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../components/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? gender;
  String? status;
  final itemsGender = ['Laki - laki', 'Perempuan'];
  final itemsStatus = ['Ayah', 'Ibu', 'Saudara Kandung'];
  final TextEditingController dateCtl = TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();

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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            regularField(
                                controller: _nameEditingController,
                                hintText: 'Tempat Lahir',
                                assetIcon: 'assets/icons/address.svg'),
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
                            genderField(
                                hintText: 'Jenis Kelamn',
                                assetIcon: 'assets/icons/gender.svg',
                                item: itemsGender),
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
                            statusField(
                                hintText: 'Status Keluarga',
                                assetIcon: 'assets/icons/status.svg',
                                item: itemsStatus),
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
                          child: dateCtl.text.isEmpty &&
                                  _nameEditingController.text.isEmpty
                              ? ElevatedButton(
                                  onPressed: null,
                                  child: Text(
                                    "Simpan",
                                    style:
                                        TextStyle(color: Colors.grey.shade300),
                                  ),
                                )
                              : ElevatedButton(
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
            child: GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2023));

                if (pickedDate != null) {
                  setState(
                    () {
                      dateCtl.text =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                    },
                  );
                }
              },
              child: TextFormField(
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey.shade700),
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
                  contentPadding: const EdgeInsets.only(
                      top: 8, left: 16, bottom: 8, right: 8),
                  hintText: hintText,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.grey.shade400),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: pressedColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: pressedColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                textInputAction: TextInputAction.next,
                controller: dateCtl,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
              ),
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
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.grey.shade700),
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
                    color: pressedColor,
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
                    color: pressedColor,
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
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.grey.shade700),
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
                    color: pressedColor,
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
                    color: pressedColor,
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
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.grey.shade700),
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
                    color: pressedColor,
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
                    color: pressedColor,
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

  Widget genderField({assetIcon, hintText, item}) {
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
          child: Container(
            height: 45,
            padding:
                const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text(
                  hintText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.grey.shade400),
                ),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey.shade400),
                isExpanded: true,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey.shade400,
                ),
                value: gender,
                items:
                    item.map<DropdownMenuItem<String>>(buildMenuItem).toList(),
                onChanged: (value) => setState(
                  () => gender = value.toString(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget statusField({assetIcon, hintText, item}) {
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
          child: Container(
            height: 45,
            padding:
                const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text(
                  hintText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.grey.shade400),
                ),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey.shade400),
                isExpanded: true,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey.shade400,
                ),
                value: status,
                items:
                    item.map<DropdownMenuItem<String>>(buildMenuItem).toList(),
                onChanged: (value) => setState(
                  () => status = value.toString(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.grey.shade700),
      ),
    );
  }
}
