import 'package:dio/dio.dart';
import 'package:gym_app/features/Logic/service/BMI_Endpoint.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://www.gymfit.somee.com/swagger/index.html",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<void> uploadData(Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post("/api/Bmi/calculate", data: data);
      return response.data;
    } catch (e) {
      throw Exception("Failed to upload data: $e");
    }
  }
}
