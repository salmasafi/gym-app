import 'package:bloc/bloc.dart';
import 'package:gym_app/core/Services/API_BMI/APIservices.dart';
import 'package:gym_app/core/Services/API_BMI/BMI_Endpoint.dart';

part 'bmi_info_request_state.dart';

class BmiInfoRequestCubit extends Cubit<BmiInfoRequestState> {
  BmiInfoRequestCubit() : super(BmiInfoRequestInitial());

  String? gender;
  String? age;
  String? weightValue;
  String? weightUnit;
  String? heightValue;
  String? heightUnit;
  String? waist;
  String? hip;

  void getGender(String selectedGender) {
    gender = selectedGender;
    if (gender == "Male") {
      emit(BmiInfoRequestGenderMale());
    } else {
      emit(BmiInfoRequestGenderFemale());
    }
  }

  void getAge(String selectedAge) {
    age = selectedAge;
    emit(BmiInfoRequestAge());
  }

  void getWeightValue(String value) {
    weightValue = value;
    emit(BmiInfoRequestWeightValue());
  }

  void getWeightUnit(String unit) {
    weightUnit = unit;
    emit(BmiInfoRequestWeightUnit());
  }

  void getHeightValue(String value) {
    heightValue = value;
    emit(BmiInfoRequestHeightValue());
  }

  void getHeightUnit(String unit) {
    heightUnit = unit;
    emit(BmiInfoRequestHeightUnit());
  }

  void getWaist(String selectedWaist) {
    waist = selectedWaist;
    emit(BmiInfoRequestWaist());
  }

  void getHip(String selectedHip) {
    hip = selectedHip;
    emit(BmiInfoRequestHip());
  }

  Future<void> sendBmiData() async {
    try {
      BMI_Request bmiRequest = BMI_Request(
        weightvalue: weightValue!,
        weightunit: weightUnit!,
        heightvalue: heightValue!,
        heightunit: heightUnit!,
        sex: gender!,
        age: age!,
        waist: waist!,
        hip: hip!,
      );

      await ApiService().calculateBMI(bmiRequest);
    } catch (e) {
      print(e.toString());
    }
  }
}
