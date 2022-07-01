class UserModel {
  int? id;
  String? username;
  String? name;
  String? email;
  String? password;
  Map<String, dynamic>? profile;

  UserModel(
      {this.id,
      this.name,
      this.profile,
      this.email,
      this.password,
      this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        profile: json['profile'],
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "profile": profile,
        "email": email,
        "password": password,
      };
}
