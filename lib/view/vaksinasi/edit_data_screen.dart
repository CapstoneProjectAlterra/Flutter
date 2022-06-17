import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../components/botnavbar.dart';
import '../../components/constants.dart';
import '../../components/navigator_fade_transition.dart';

class EditDataScreen extends StatefulWidget {
  const EditDataScreen({Key? key}) : super(key: key);

  @override
  State<EditDataScreen> createState() => _RegisterState();
}

class _RegisterState extends State<EditDataScreen> {
  String? gender;
  String? status;
  final itemsGender = ['Laki - laki', 'Perempuan'];
  final itemsStatus = ['Ayah', 'Ibu', 'Saudara Kandung'];
  var obscureText = true;
  bool isLoading = false;
  final TextEditingController dateCtl = TextEditingController();
  final _nameEditingController = TextEditingController();
  final _nikEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                      width: 36,
                      height: 36,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Tambah Anggota Keluarga",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFieldName("NIK"),
                        const SizedBox(height: 8),
                        fieldNIK(),
                        const SizedBox(height: 16),
                        //.
                        textFieldName("Nama"),
                        const SizedBox(height: 8),
                        fieldNamaLengkap(),
                        const SizedBox(height: 16),
                        //.
                        textFieldName("Tempat Lahir"),
                        const SizedBox(height: 8),
                        fieldNamaLengkap(),
                        const SizedBox(height: 16),
                        //.
                        textFieldName("Tanggal Lahir"),
                        const SizedBox(height: 8),
                        dateField(hintText: 'pilih tanggal'),
                        const SizedBox(height: 16),
                        //.
                        textFieldName("Jenis Kelamin"),
                        const SizedBox(height: 8),
                        statusField(hintText: 'pilih', item: itemsStatus),
                        const SizedBox(height: 16),
                        //.
                        textFieldName("Hubungan Keluarga"),
                        const SizedBox(height: 8),
                        statusField(hintText: 'pilih', item: itemsGender),
                        const SizedBox(height: 16),
                        //.
                        textFieldName("Email"),
                        const SizedBox(height: 8),
                        textFieldEmail(),
                        const SizedBox(height: 16),
                        //.
                        textFieldName("No. HP"),
                        const SizedBox(height: 8),
                        fieldNomor(),
                        const SizedBox(height: 16),
                        //.
                        textFieldName("Alamt Berdasarkan KTP"),
                        const SizedBox(height: 8),
                        fieldNamaLengkap(),
                        const SizedBox(height: 16),
                        //.
                        textFieldName("Alamat saat ini"),
                        const SizedBox(height: 8),
                        fieldNamaLengkap(),
                        const SizedBox(height: 30),
                        Center(
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "EDIT",
                                    ),
                              onPressed: () async {
                                _formKey.currentState!.save();
                                if (isLoading) return;
                                setState(() => isLoading = true);
                                await Future.delayed(
                                  const Duration(seconds: 2),
                                );
                                setState(() => isLoading = false);
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  try {
                                    Future.delayed(
                                      const Duration(seconds: 2),
                                    ).then(
                                      (value) async => Navigator.of(context)
                                          .pushAndRemoveUntil(
                                        NavigatorFadeTransition(
                                          child: const BotNavBar(),
                                        ),
                                        ModalRoute.withName('/home'),
                                      ),
                                    );
                                  } catch (e) {
                                    Fluttertoast.showToast(
                                      msg: e.toString(),
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ],
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

  Widget textFieldName(label) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: defaultPadding / 3,
      ),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Colors.grey.shade700),
      ),
    );
  }

  Widget fieldNamaLengkap() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        cursorColor: Colors.white,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
          hintText: 'input',
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
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
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
        controller: _nameEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Required";
          }
          return null;
        },
      ),
    );
  }

  Widget fieldNIK() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        cursorColor: Colors.white,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(16),
        ],
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
          hintText: 'input',
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
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
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
        controller: _nikEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Required";
          } else if (value.length < 16) {
            return "use valid nik";
          }
          return null;
        },
      ),
    );
  }

  Widget passwordFieldPassword() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        obscureText: obscureText,
        cursorColor: Colors.white,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(
                () {
                  obscureText = !obscureText;
                },
              );
            },
            child: obscureText
                ? const Icon(
                    Icons.visibility_off_rounded,
                    color: Colors.grey,
                  )
                : const Icon(Icons.visibility_rounded, color: Colors.grey),
          ),
          hintText: 'input',
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
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
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
        inputFormatters: [
          LengthLimitingTextInputFormatter(13),
        ],
        controller: _passwordEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Required";
          } else if (value.length < 8) {
            return "Minimum password 8 character";
          }
          return null;
        },
      ),
    );
  }

  Widget textFieldEmail() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        cursorColor: Colors.white,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
          hintText: 'input',
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
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
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
        controller: _emailEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Required";
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return "Use valid email";
          }
          return null;
        },
      ),
    );
  }

  Widget dateField({controller, hintText}) {
    return SizedBox(
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
                dateCtl.text = DateFormat('dd-MM-yyyy').format(pickedDate);
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
            contentPadding:
                const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.grey.shade400),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: buttonColorSecondary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: buttonColorSecondary,
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
    );
  }

  Widget genderField({assetIcon, hintText, item}) {
    return Container(
      height: 45,
      padding: const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
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
          items: item.map<DropdownMenuItem<String>>(buildMenuItem).toList(),
          onChanged: (value) => setState(
            () => gender = value.toString(),
          ),
        ),
      ),
    );
  }

  Widget statusField({hintText, item}) {
    return Container(
      height: 45,
      padding: const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
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
          items: item.map<DropdownMenuItem<String>>(buildMenuItem).toList(),
          onChanged: (value) => setState(
            () => status = value.toString(),
          ),
        ),
      ),
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

  Widget fieldNomor() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        cursorColor: Colors.white,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(16),
        ],
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
          hintText: 'input',
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
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
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
        controller: _nikEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Required";
          }
          return null;
        },
      ),
    );
  }
}
