class ApiModels {
  String name;
  String email;
  String password;
  double height;
  double weight;
  String image;
  ApiModels(
      {required this.name,
      required this.email,
      required this.password,
      required this.height,
      required this.weight,
      required this.image});
  factory ApiModels.fromJson(Map json) {
    return ApiModels(
      email: json["Email"] ?? "No email",
      name: json["FullName"] ?? "No Name",
      height: json["Height"] ?? 170,
      weight: json["Weight"] ?? 65,
      image: json["Image"] ?? "No Image",
      password: json["Password"] ?? 123456789,
    );
  }
}
