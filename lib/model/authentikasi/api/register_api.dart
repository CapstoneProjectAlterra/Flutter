import 'package:dio/dio.dart';

import '../register_model.dart';

class RegisterApi {
  postLogin({RegisterModel? register}) async {
    try {
      await Dio().post(
        "http://ec2-3-237-105-224.compute-1.amazonaws.com:8080/api/v1/auth/register",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: register!.toJson(),
      );
    } catch (e) {
      if (e is DioError) {
        throw e.toString();
      }
    }
  }
}
