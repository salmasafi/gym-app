class BMI_Request {
  final String weightvalue;
  final String weightunit;
  final String heightvalue;
  final String heightunit;
  final String sex;
  final String age;
  String? waist = " ";
  String? hip = " ";

  BMI_Request({
    required this.weightvalue,
    required this.weightunit,
    required this.heightvalue,
    required this.heightunit,
    required this.sex,
    required this.age,
    required this.waist,
    required this.hip,
  });

  Map<String, dynamic> toJson() {
    return {
      "weight": {
        "value": weightvalue.toString(),
        "unit": weightunit.toString(),
      },
      "height": {
        "value": heightvalue.toString(),
        "unit": heightunit.toString(),
      },
      "sex": sex.toString(),
      "age": age.toString(),
      "waist": waist.toString(),
      "hip": hip.toString(),
    };
  }
}
