class Login {
  String? nik;
  String? password;

  Login({this.nik, this.password});

  factory Login.fromJson(Map<String, dynamic> json) =>
      Login(nik: json['username'], password: json['passowrd']);
  Map<String, dynamic> toJson() => {'username': nik, 'password': password};
}
