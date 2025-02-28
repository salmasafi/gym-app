class BMI_EndPoint {
  String? WeightValue = " ";
  String? WeightUnit = " ";
  String? heightValue = " ";
  String? heightUnit = " ";
  String? Gender = " ";
  String? Age = " ";
  String? WaistValue = " ";
  String? HipUnit = " ";

  BMI_EndPoint(
      {required this.WeightValue,
      required this.WeightUnit,
      required this.heightValue,
      required this.heightUnit,
      required this.Gender,
      required this.Age,
      required this.WaistValue,
      required this.HipUnit});

  factory BMI_EndPoint.fromJson(Map json) {
    return BMI_EndPoint(
      WeightValue: json['weight']['value'],
      WeightUnit: json['weight']['unit'],
      heightValue: json['height']['value'],
      heightUnit: json['height']['unit'],
      Gender: json['sex'],
      Age: json['age'],
      WaistValue: json['waist'],
      HipUnit: json['hip'] ?? {},
    );
  }
}
