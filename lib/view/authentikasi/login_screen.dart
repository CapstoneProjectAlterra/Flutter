import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vaccine_booking/components/botnavbar.dart';
import 'package:vaccine_booking/components/navigator_fade_transition.dart';
import 'package:vaccine_booking/view/authentikasi/register_screen.dart';

import '../../components/constants.dart';
import '../../components/navigator_slide_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _RegisterState();
}

class _RegisterState extends State<LoginScreen> {
  bool isLoading = false;
  final _passwordEditingController = TextEditingController();
  final _nikEditingController = TextEditingController();

  @override
  void dispose() {
    _passwordEditingController.dispose();
    _nikEditingController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                      onPressed: () async {
                        if (isLoading) return;
                        setState(() => isLoading = true);
                        await Future.delayed(
                          const Duration(seconds: 2),
                        );
                        setState(() => isLoading = false);
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          await Future.delayed(
                            const Duration(seconds: 2),
                          )
                              .then(
                                (value) async =>
                                    Navigator.of(context).pushAndRemoveUntil(
                                  NavigatorFadeTransition(
                                    child: const BotNavBar(),
                                  ),
                                  ModalRoute.withName('/home'),
                                ),
                              )
                              .then(
                                (_) => Fluttertoast.showToast(
                                    msg: "Berhasil Login"),
                              );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Belum punya akun?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          NavigatorSlideTransition(
                            child: const RegisterScreen(),
                            direction: AxisDirection.right,
                          ),
                        );
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
