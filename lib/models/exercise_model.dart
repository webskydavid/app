import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'models.dart';

part 'exercise_model.g.dart';

@HiveType(typeId: 2)
class ExerciseModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String date;
  @HiveField(2)
  String time;
  @HiveField(3)
  String name;
  @HiveField(4)
  String note;
  @HiveField(5)
  List<String> muscleGroup;
  @HiveField(6)
  ParametersModel parameters;

  ExerciseModel({
    @required this.id,
    @required this.date,
    @required this.time,
    @required this.name,
    this.note,
    this.muscleGroup,
    this.parameters,
  });
}
