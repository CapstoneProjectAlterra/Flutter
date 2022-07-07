class UserModel {
  Map<String, dynamic> profile;
  String username;
  UserModel({required this.profile, required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        profile: json['profile'],
        username: json['username'],
      );
}
