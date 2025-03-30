import 'package:dio/dio.dart';
import 'package:gym_app/features/Logic/Models/APIExerciseModel.dart';

class apiServices {
  final String baseUrl = "http://www.gymfit.somee.com/api/Exercise";
  final Dio dio = Dio();

  Future<ExerciseBodyPart?> bodypartslist() async {
    try {
      final String url = "$baseUrl/bodypart/list";
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return ExerciseBodyPart.fromJson(response.data);
      } else {
        print("Failed to load body parts");
      }
    } catch (e) {
      print("Error Fetching the data: $e");
      return null;
    }
  }
}
