import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/core/Models/api_model.dart';
import 'package:gym_app/core/Services/apiservices.dart';
import 'package:gym_app/features/homescreen/presentation/screens/home_screen.dart';

part 'startbutton_state.dart';

ApiModels? apiModels;

class StartbuttonCubit extends Cubit<StartbuttonState> {
  StartbuttonCubit() : super(StartbuttonInitial());

  void postdata(
      BuildContext context,
      String email,
      String name,
      int age,
      String sex,
      String image,
      double weight,
      double height,
      String password,
      String nickname) async {
    emit(StartbuttonLoading());

    try {
      await Apiservices().postData(
          email, name, age, sex, image, weight, height, password, nickname);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      emit(StartbuttonInitial());
    } catch (e) {
      print(e);
    }
    emit(StartbuttonError());
  }
}
