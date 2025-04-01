import 'package:dio/dio.dart';
import 'package:gym_app/models/BMI_Endpoint_Model.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl = "http://www.gymfit.somee.com";

  Future<void> sendBMIWithDelay(BMI_Request bmi) async {
    await Future.delayed(Duration(seconds: 2));
    await sendBMI(bmi);
  }

  Future<Map<String, dynamic>?> sendBMI(BMI_Request bmi) async {
    String url = "$baseUrl/api/Bmi/calculate";

    if (bmi.weightvalue == null ||
        bmi.heightvalue == null ||
        bmi.age == null ||
        bmi.sex == null ||
        bmi.waist == null ||
        bmi.hip == null) {
      print("ERROR: Missing required fields in BMI request!");
      return null;
    }

    try {
      print("Sending JSON to API: ${bmi.toJson()}");
      print("Sending data to API: ${bmi.toJson()}");

      Response response = await dio.post(
        url,
        data: bmi.toJson(),
        options: Options(
            headers: {"Content-Type": "application/json", "accept": "*/*"}),
      );

      print("API Response: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        print("API Error: ${response.statusCode} - ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      print("API Request Failed: $e");
      return null;
    }
  }
}
