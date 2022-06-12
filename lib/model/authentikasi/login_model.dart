class LoginModel {
  String? nik;
  String? password;
  bool? returnSecureToken;

  LoginModel({this.nik, this.password, this.returnSecureToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      nik: json['email'],
      password: json['password'],
      returnSecureToken: json['returnSecureToken']);
  Map<String, dynamic> toJson() => {
        'email': nik,
        'password': password,
        'returnSecureToken': returnSecureToken
      };
}
