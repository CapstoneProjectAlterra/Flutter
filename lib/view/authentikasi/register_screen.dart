import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../components/botnavbar.dart';
import '../../components/constants.dart';
import '../../components/navigator_slide_transition.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  bool isLoading = false;
  final _nameEditingController = TextEditingController();
  final _nikEditingController = TextEditingController();
  final _phoneEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFieldName("Nama Lengkap"),
                        const SizedBox(height: 8),
                        TextFormField(
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 5.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey,
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
                        const SizedBox(height: 16),
                        textFieldName("NIK"),
                        const SizedBox(height: 8),
                        TextFormField(
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                          ],
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 5.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey,
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
                        const SizedBox(height: 16),
                        textFieldName("No. Hp"),
                        const SizedBox(height: 8),
                        TextFormField(
                          cursorColor: Colors.white,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(14),
                          ],
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 5.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey,
                            filled: true,
                          ),
                          textInputAction: TextInputAction.next,
                          controller: _phoneEditingController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        textFieldName("Email"),
                        const SizedBox(height: 8),
                        TextFormField(
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 5.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey,
                            filled: true,
                          ),
                          textInputAction: TextInputAction.next,
                          controller: _emailEditingController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return "Use valid email";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        textFieldName("Password"),
                        const SizedBox(height: 8),
                        TextFormField(
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.name,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 5.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey,
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
                        const SizedBox(height: 30),
                        Center(
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                child: isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        "REGISTER",
                                        style: TextStyle(color: Colors.white),
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
                                          NavigatorSlideTransition(
                                            child: const BotNavBar(),
                                            direction: AxisDirection.left,
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
                                }),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        )),
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
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
