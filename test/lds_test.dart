import 'package:app/models/models.dart';
import 'package:app/services/local_data_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

main() {
  test('foo', () async {
    Hive.init('./');
    Hive.registerAdapter(BaseExerciseModelAdapter());
    Hive.registerAdapter(ExerciseModelAdapter());
    Hive.registerAdapter(ParametersModelAdapter());

    var lds = LocalDataService();

    await lds.init();
    lds.getExercisesBy('32323');
  });
}
