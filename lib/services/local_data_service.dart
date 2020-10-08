import 'package:app/models/models.dart';
import 'package:hive/hive.dart';

class LocalDataService {
  Box<List<ExerciseModel>> exerciseBox;

  void init() async {
    await Hive.openBox('20201010');
  }

  void getExercisesBy(String day) {}
}
