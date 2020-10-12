import 'package:app/models/models.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class ExerciseListService {
  bool exerciseExists = false;
  List<ExerciseModel> list = [];
  final String currentDate = DateFormat('yyyyMMdd').format(DateTime.now());

  ExerciseListService() {
    print('ExerciseListService()');
    checkIfExerciseExists();
  }

  Future<void> getExercisesBy(String date) async {
    print('getExercisesBy()');
    list = [ExerciseModel(id: '1', date: '1', time: '1', name: '1')];
  }

  void checkIfExerciseExists() async {
    print('checkIfBoxExists()');
    exerciseExists = await Hive.boxExists(currentDate);
  }
}
