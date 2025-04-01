import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/core/Logic/service/API/APIExerciseService.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit() : super(ExerciseInitial());

  Future<void> getBodyPartslist() async {
    try {
      final bodyPartslist = await apiServices().bodypartslist();
      emit(ExercisebodypartsList());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getBodyPartsSearch() async {
    try {
      final bodyParts = await apiServices().bodypartslist();
      emit(ExerciseSearch());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getBodyParts() async {
    try {
      final bodyParts = await apiServices().bodypartslist();
      emit(ExercisebodypartsList());
    } catch (e) {
      print(e.toString());
    }
  }
}
