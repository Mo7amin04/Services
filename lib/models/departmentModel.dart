class DepartmentModel {
  String? name;
  String? image;

  DepartmentModel({
    this.name,
    this.image,
  });

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    image = json["image"];

  }

  Map<String, dynamic> toMap() {
    return {

      "name": name,
      "image": image,
    };
  }
}
