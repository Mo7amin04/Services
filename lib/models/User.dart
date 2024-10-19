class UserModel {
  String? name;
  String? phone;
  String? email;
  String? uId;

  UserModel({
    this.name,
    this.phone,
    this.uId,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    phone = json["phone"];
    uId = json["uId"];
    name = json["name"];
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "phone": phone,
      "name": name,
      "uId": uId,
     };
  }
}
