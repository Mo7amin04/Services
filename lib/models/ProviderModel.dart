class ProviderModel {
  String? firstname;
  String? lastname;
  String? phone;
  String? BOD;
  String? sex;
  String? nationality;
  String? city;
  String? uId;
  String? skill;
  String? rate;

  ProviderModel({
    this.lastname,
    this.phone,
    this.uId,
    this.firstname,
    this.sex,
    this.BOD,
    this.city,
    this.skill,
    this.nationality,
    this.rate,
  });

  ProviderModel.fromJson(Map<String, dynamic> json) {
    lastname = json["lastname"];
    phone = json["phone"];
    uId = json["uId"];
    city = json["city"];
    firstname = json["firstname"];
    BOD = json["BOD"];
    sex = json["sex"];
    nationality = json["nationality"];
    skill = json["skill"];
    rate = json["rate"];
  }

  Map<String, dynamic> toMap() {
    return {
      "lastname": lastname,
      "phone": phone,
      "firstname": firstname,
      "skill": skill,
      "BOD": BOD,
      "sex": sex,
      "city": city,
      "uId": uId,
      "nationality": nationality,
      "rate": rate,
    };
  }
}
