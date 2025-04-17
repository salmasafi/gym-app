import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/features/Screens/screens_Home/home_screen.dart';
import 'package:gym_app/core/Services/auth_apiservices.dart';
part 'startbutton_state.dart';

class StartbuttonCubit extends Cubit<StartbuttonState> {
  StartbuttonCubit() : super(StartbuttonInitial());

  void register(
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
      bool result = await Apiservices().register(
          email, name, age, sex, image, weight, height, password, nickname);
      if (result == true) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
        emit(StartbuttonSuccess());
      } else {
        emit(StartbuttonError('something wrong with api request'));
      }
    } catch (e) {
      print(e);
      emit(StartbuttonError(e.toString()));
    }
  }
}
