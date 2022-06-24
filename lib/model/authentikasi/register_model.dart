class RegisterModel {
  String? nik;
  String? email;
  String? password;
  Map<String, String>? profile;

  RegisterModel({this.nik, this.email, this.password, this.profile});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        nik: json['username'],
        email: json['email'],
        password: json['password'],
        profile: json['profile'],
      );
  Map<String, dynamic> toJson() => {
        'username': nik,
        'email': email,
        'password': password,
        'profile': profile,
      };
}
