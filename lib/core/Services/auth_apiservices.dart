import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/features/Screens/screens_Home/home_screen.dart';

class Apiservices {
  Response? response;
  Dio dio = Dio();
  String baseUrl = "https://www.gymfit.somee.com/api";

  Future<bool> register(
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
      response = await dio.post("$baseUrl/Auth/register/trainee",
          data: {
            "Image": image,
            "FullName": name,
            "Email": email,
            "Password": password,
            "Sex": sex,
            "Age": age,
            "Weight": weight,
            "Height": height,
            "Waist": 0,
            "Hip": 0
          },
          options: Options(headers: {'Content-Type': 'application/json'}));
      print('---------------------------------------------');
      print(response!.data);
      return true;
    } catch (e) {
      print(e);
      return false;
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

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      response = await dio.post("$baseUrl/Auth/login",
          data: {"email": email, "password": password},
          options: Options(headers: {'Content-Type': 'application/json'}));
      print('---------------------------------------------');
      print(response!.data);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
        (route) => false,
      );
    } catch (e) {
      print(e);
       Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
        (route) => false,
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("There is an error, please try again, ${e}")),
      // );
    }
  }
}
