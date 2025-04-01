import 'package:dio/dio.dart';
import 'package:gym_app/models/Models/api_model.dart';

class Apiservices {
  Response? response;
  Dio dio = Dio();
  String postBaseUrl = "https://www.gymfit.somee.com/api/Auth/register/trainee";

  Future<void> postData(
      String email,
      String name,
      int age,
      String sex,
      String image,
      double weight,
      double height,
      String password,
      String nickname) async {
    try {
      response = await dio.post(
          "https://www.gymfit.somee.com/api/Auth/register/trainee",
          data: {
            "Email": email,
            "Age": age,
            "Image": image,
            "Height": height,
            "Weight": weight,
            "FullName": name,
            "Password": password,
            "Nickname": nickname
          },
          options: Options(headers: {'Content-Type': 'application/json'}));
      print(response!.data);
    } catch (e) {
      print(e);
    }
    // return ApiModels(
    //   email: email,
    //   height: height,
    //   image: image,
    //   name: name,
    //   weight: weight,
    //   password: password
    // );
  }
}
