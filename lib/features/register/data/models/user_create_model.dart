class UserModel {
  String? name;
  String? userId;
  String? email;

  UserModel({this.name, this.userId, this.email});

  UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    email = json['email'];
    name = json['name'];
    userId = json['userId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'userId': userId,
    };
  }
}
