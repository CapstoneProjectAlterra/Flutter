import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:vaccine_booking/components/botnavbar.dart';
import 'package:vaccine_booking/components/navigator_fade_transition.dart';
import 'package:vaccine_booking/model/authentikasi/login_model.dart';
import 'package:vaccine_booking/view/authentikasi/register_screen.dart';
import 'package:vaccine_booking/view/welcome/welcome_screen.dart';
import 'package:vaccine_booking/view_model/auth_view_model.dart';

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
    final login = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    NavigatorSlideTransition(
                        child: const WelcomeScreen(),
                        direction: AxisDirection.left),
                  ),
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
                  "Login",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Colors.black,
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
                      fieldNIK(),
                      const SizedBox(height: 16),
                      textFieldName("Password"),
                      const SizedBox(height: 8),
                      fieldPassowrd()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                loginButton(login),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum punya akun?",
                        style: Theme.of(context).textTheme.bodyText1),
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
                      child: Text("Register",
                          style: Theme.of(context).textTheme.headline4),
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

  Widget loginButton(login) {
    return Center(
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  "LOGIN",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
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

              try {
                await Future.delayed(
                  const Duration(seconds: 2),
                )
                    .then(
                      (value) async => await login.postLogin(
                        LoginModel(
                          nik: _nikEditingController.text,
                          password: _passwordEditingController.text,
                          returnSecureToken: true,
                        ),
                      ),
                    )
                    .then(
                      (_) => Fluttertoast.showToast(msg: "Berhasil Login"),
                    )
                    .then(
                      (_) => Navigator.of(context).pushAndRemoveUntil(
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
    );
  }

  Widget fieldPassowrd() {
    return TextFormField(
      cursorColor: Colors.white,
      keyboardType: TextInputType.name,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'input',
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: buttonColorSecondary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: buttonColorSecondary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
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
    );
  }

  Widget fieldNIK() {
    return TextFormField(
      cursorColor: Colors.white,
      // keyboardType: TextInputType.phone,
      inputFormatters: [
        //   FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
      ],
      decoration: InputDecoration(
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
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: buttonColorSecondary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
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
        // else if (value.length < 16) {
        //   return "use valid nik";
        // }
        return null;
      },
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
}
