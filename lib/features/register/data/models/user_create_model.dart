class UserModel {
  String? name;
  String? userId;
  String? email;
  String? img;

  UserModel({this.name, this.userId, this.email, this.img});

  UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    email = json['email'];
    name = json['name'];
    userId = json['userId'];
    img = json['img'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'userId': userId,
      'img': img,
    };
  }
}
