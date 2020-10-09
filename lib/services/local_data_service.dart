import 'package:app/models/models.dart';
import 'package:hive/hive.dart';

class LocalDataService {
  Box<List<ExerciseModel>> exerciseBox;

  Future<void> init() async {
    exerciseBox = await Hive.openBox<List<ExerciseModel>>('20201010');
  }

  void getExercisesBy(String day) {
    
  }

  void add(ExerciseModel exercise) {
    List<ExerciseModel> list = exerciseBox.get(key)
    exerciseBox.put('key', [exercise]);
  }
  void removeExercise() {}
}
