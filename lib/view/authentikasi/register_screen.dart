import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../components/botnavbar.dart';
import '../../components/constants.dart';
import '../../components/navigator_fade_transition.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  var obscureText = true;
  bool isLoading = false;
  final _nameEditingController = TextEditingController();
  final _nikEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Register",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 32),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFieldName("Nama Lengkap"),
                        const SizedBox(height: 8),
                        fieldNamaLengkap(),
                        const SizedBox(height: 16),
                        textFieldName("NIK"),
                        const SizedBox(height: 8),
                        fieldNIK(),
                        const SizedBox(height: 16),
                        textFieldName("Email"),
                        const SizedBox(height: 8),
                        textFieldEmail(),
                        const SizedBox(height: 16),
                        textFieldName("Password"),
                        const SizedBox(height: 8),
                        passwordFieldPassword(),
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
                                      "REGISTER",
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
}
