import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'models.dart';

@HiveType(typeId: 1)
class BaseExerciseModel {
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

  BaseExerciseModel({
    @required this.id,
    @required this.date,
    @required this.time,
    @required this.name,
    this.note,
    this.muscleGroup,
  });
}

@HiveType(typeId: 2)
class ExerciseModel extends BaseExerciseModel {
  @HiveField(0)
  Parameters parameters;

  ExerciseModel({
    @required id,
    @required date,
    @required time,
    @required name,
    note,
    muscleGroup,
    this.parameters,
  }) : super(
          id: id,
          date: date,
          time: time,
          name: name,
          note: note,
          muscleGroup: muscleGroup,
        );
}
