import 'package:app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/models.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BaseExerciseModelAdapter());
  Hive.registerAdapter(ExerciseModelAdapter());
  Hive.registerAdapter(ParametersModelAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExerciseListScreen(),
    );
  }
}
